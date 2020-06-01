#Final Project Code for Group 7 - Alec Countryman, Elliott Newman, and Kelsey Petrich
###################################################################################################
library(quantmod)
library(MSGARCH)
library(forecast)

#Read in S&P 500 Data #############################################################################

getSymbols("^GSPC", from = "1990-01-01", to = "2020-04-15") 

#Calculate Log Return and rename column ###########################################################
GSPC.rtn <- Delt(GSPC$GSPC.Adjusted)
GSPC.rtn <- GSPC.rtn[-1,]
GSPC.lrtn <- log(GSPC.rtn+1)
names(GSPC.lrtn) <- "logReturn"

#Inspect the ACF plot of log returns ##############################################################
acf(GSPC.lrtn)

# Determine best ARMA model for log returns based on BIC ##########################################
# Since the acf looked stationary, set stationary = T
GSPC.m<-auto.arima(GSPC.lrtn, stationary = T, ic = "bic")
GSPC.m

# Residuals of ARMA model to be used for MSGARCH ##################################################
GSPC.m$residuals


# MSGARCH
# Then consider the following possible volatility model settings for the residuals 
# of the selected ARMA model: number of states/regimes (1 or 2), conditional
# variance dynamics (GARCH model or GJR model), and conditional distributions 
# (Normal, Student-t, or skewed Student-t). 

# Number of States/Regimes -> switch.spec 
# variance.spec options = "sGARCH", "gjrGARCH"
# distribution.spec options = "norm", "std", "sstd"

#Single Regime ####################################################################################
spec1 <- CreateSpec(variance.spec = list(model = "sGARCH"), 
                    distribution.spec = list(distribution = c("norm")))
spec2 <- CreateSpec(variance.spec = list(model = "sGARCH"), 
                    distribution.spec = list(distribution = c("std")))
spec3 <- CreateSpec(variance.spec = list(model = "sGARCH"), 
                    distribution.spec = list(distribution = c("sstd")))
spec4 <- CreateSpec(variance.spec = list(model = "gjrGARCH"), 
                    distribution.spec = list(distribution = c("norm")))
spec5 <- CreateSpec(variance.spec = list(model = "gjrGARCH"), 
                    distribution.spec = list(distribution = c("std")))
spec6 <- CreateSpec(variance.spec = list(model = "gjrGARCH"), 
                    distribution.spec = list(distribution = c("sstd")))

#Two Regimes ######################################################################################
spec7 <- CreateSpec(variance.spec = list(model = "sGARCH"), 
                    distribution.spec = list(distribution = c("norm")), switch.spec = list(K=2))
spec8 <- CreateSpec(variance.spec = list(model = "sGARCH"), 
                    distribution.spec = list(distribution = c("std")), switch.spec = list(K=2))
spec9 <- CreateSpec(variance.spec = list(model = "sGARCH"), 
                    distribution.spec = list(distribution = c("sstd")), switch.spec = list(K=2))
spec10 <- CreateSpec(variance.spec = list(model = "gjrGARCH"), 
                     distribution.spec = list(distribution = c("norm")), switch.spec = list(K=2))
spec11 <- CreateSpec(variance.spec = list(model = "gjrGARCH"), 
                     distribution.spec = list(distribution = c("std")), switch.spec = list(K=2))
spec12 <- CreateSpec(variance.spec = list(model = "gjrGARCH"), 
                     distribution.spec = list(distribution = c("sstd")), switch.spec = list(K=2))

#Fit each model using FitML #######################################################################
fit.ml.1 <- FitML(spec = spec1, data = GSPC.m$residuals)
fit.ml.2 <- FitML(spec = spec2, data = GSPC.m$residuals)
fit.ml.3 <- FitML(spec = spec3, data = GSPC.m$residuals)
fit.ml.4 <- FitML(spec = spec4, data = GSPC.m$residuals)
fit.ml.5 <- FitML(spec = spec5, data = GSPC.m$residuals)
fit.ml.6 <- FitML(spec = spec6, data = GSPC.m$residuals)
fit.ml.7 <- FitML(spec = spec7, data = GSPC.m$residuals)
fit.ml.8 <- FitML(spec = spec8, data = GSPC.m$residuals)
fit.ml.9 <- FitML(spec = spec9, data = GSPC.m$residuals)
fit.ml.10 <- FitML(spec = spec10, data = GSPC.m$residuals)
fit.ml.11 <- FitML(spec = spec11, data = GSPC.m$residuals)
fit.ml.12 <- FitML(spec = spec12, data = GSPC.m$residuals)

#Summary of each model ############################################################################
summary(fit.ml.1)
summary(fit.ml.2)
summary(fit.ml.3)
summary(fit.ml.4)
summary(fit.ml.5)
summary(fit.ml.6)
summary(fit.ml.7)
summary(fit.ml.8)
summary(fit.ml.9)
summary(fit.ml.10)
summary(fit.ml.11)
summary(fit.ml.12)

#Save the BIC of each model in a dataframe ########################################################
models <- c("fit.ml.1","fit.ml.2","fit.ml.3","fit.ml.4","fit.ml.5","fit.ml.6",
               "fit.ml.7","fit.ml.8","fit.ml.9","fit.ml.10","fit.ml.11","fit.ml.12")

dfBIC <- data.frame(model = models, BIC = c(BIC(fit.ml.1), BIC(fit.ml.2), BIC(fit.ml.3), 
                                            BIC(fit.ml.4), BIC(fit.ml.5), BIC(fit.ml.6),
                                            BIC(fit.ml.7), BIC(fit.ml.8), BIC(fit.ml.9), 
                                            BIC(fit.ml.10), BIC(fit.ml.11), BIC(fit.ml.12)))

#Which model has the lowest BIC: ##################################################################
dfBIC[which.min(dfBIC$BIC),]

#Rank by BIC from most preferred to least preferred: ##############################################
dfBICRank <- dfBIC[order(dfBIC$BIC),]
dfBICRank

#Unconditional volatility calculatino for both regimes
sqrt(250) * sapply(ExtractStateFit(fit.ml.12), UncVol)

#VaR and Back testing at alpha = 1% or 5% risk ####################################################

#Variable delcaration and preparation for 
modelSpec <- list(spec1,spec2,spec3,spec4,spec5,spec6,spec7,spec8,spec9,spec10,spec11,spec12)
n.ots <- length(GSPC.m$residuals)-2000
n.its <- 2000

#risk level and model update period
alpha <- 0.01     #or alpha = 0.05
k.update <- 100

#prepare result arrays
VaR <- matrix(NA, nrow = n.ots, ncol = length(modelSpec))
y.ots <- matrix(NA, nrow = n.ots, ncol = 1)
model.fit <- vector(mode = "list", length = length(modelSpec))

#Backtest and model reestimation iteration ########################################################
for (i in 1:n.ots) {
  
  cat("Backtest - Iteration: ", i, "\n")
  
  y.its <- GSPC.m$residuals[i:(n.its + i - 1)]
  y.ots[i] <- GSPC.m$residuals[n.its + i]
  
  for (j in 1:length(modelSpec)) {
    
    if (k.update == 1 || i %% k.update == 1) {
      cat("Model", j, "is reestimated\n")
      
      model.fit[[j]] <- FitML(spec = modelSpec[[j]], 
                              data = y.its, ctr = list(do.se = FALSE))
    }
    
    VaR[i, j] <- Risk(model.fit[[j]]$spec, par = model.fit[[j]]$par, data = y.its, 
                      n.ahead = 1, alpha = alpha, do.es = FALSE,do.its = FALSE)$VaR
  }
}

#Generate indeces for plotting and model ranking ##################################################
indx <- index(GSPC.rtn[(length(GSPC.rtn)-5628):length(GSPC.rtn),])

GSPC.4plot <- GSPC.m$residuals[(length(GSPC.m$residuals)-5628):length(GSPC.m$residuals),]
rtn.xts <- xts(GSPC.4plot, order.by = indx)
rtn.xts <- fortify(rtn.xts)
colnames(rtn.xts) <- c("Date", "rtn")

VaR.xts <- xts(VaR, order.by = indx)
VaR.xts <- fortify(VaR.xts)
colnames(VaR.xts) <- c("Date","V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11","V12")
VaR.v1 <- VaR.xts[,1:2]

#Plot returns and VaR threshold using ggplot ######################################################
library(ggplot2)

myplot <- ggplot(rtn.xts, aes(x = Date, y = rtn), 
                 labs(title="Backtesing VaR at 5% risk level",x="time"))
myplot <- myplot + geom_point(color="black", size = 1)

myplot <- myplot + geom_line(data = VaR.v1, aes(y = V1), color = "blue", size = 0.75)
print(myplot)



#Tally points below threshold and write score each model ##########################################
score.df <- data.frame(Model = character(), Score = double(),
                       deviation = double(), model_type = character(), stringsAsFactors=FALSE)

for (i in 1:12) {
  numbelowVaR <- 0
  
  for (j in 1:n.ots) {
    if (rtn.xts[j,"rtn"] < VaR.xts[j,i+1]) {
      numbelowVaR <- numbelowVaR + 1
    }
    
  }
  
  score.df[i,"Score"] <- round(numbelowVaR/n.ots, 6)
  score.df[i,"Model"] <- paste(c("Model ", i), collapse = " ")
  spec_temp <- modelSpec[[i]]
  score.df[i,"model_type"] <- spec_temp$name[[1]]
}

#Gauge models against our defined risk level 1% or 5% print results################################
score.df <- score.df[1:12,]
score.df$deviation <- abs(alpha-score.df$Score)
score.df <- score.df[order(score.df$deviation),]
score.df