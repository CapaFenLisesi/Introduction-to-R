#Loop and solve a linear reservior model in R
# first we solve using Euler integration, then we compare to the analytical solution

#dV / dt = w-q
#q = (1/Tstar)V
#w = rainfall
#q = flow
#Tstar = time constant
#V  = Volume
#dt = time increment
#numerical solution
#V = Vold +(w-q)*dt
#analytical solution
#q = w+(q0-w)*e^(-t/T*))
#t = time

dt = 0.01
Tstar = 0.5
w = 1
V = 0
t = 0
q0 = V/Tstar

# Here, we initialize vectors that will store time, Qa (the analytic solution), Qn (the numerical
# solution) and Vn (the volume).
time = matrix(0, ncol=1000,nrow=1)
Qa = matrix(0, ncol=1000,nrow=1)
Qn = matrix(0, ncol=1000,nrow=1)
Vn = matrix(0, ncol=1000,nrow=1)

# Loop through 1000 time steps, and approximate the differential equation using finite
# differences.
for(i in 0:1000){
  q = V/Tstar
  #print (paste("q= ",q))
  V = V + (w-q)*dt
  #print (paste("V=",V))
  Qa[i] = w+(q0-w)*exp(-(i*dt)/Tstar)
  time[i] = i*dt
  Qn[i] = V/Tstar
  Vn[i] = V
}

# Plot the results.
plot(time,Qn,xlim=c(0,10),xlab="Time [h]",ylab="Volume [mm]",cex = .1, col = "black", type="l")
points(time,Qa,xlim=c(0,10),cex = .1, col = "red", type="l")
points(time,Vn,xlim=c(0,10),cex = .1, col = "blue",type="l")
legend("bottomright", c("Qn","Qa","V"), cex=1.0,  col=c("black","red","blue"), lty=1)