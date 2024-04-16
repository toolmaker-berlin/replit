using Distributions
using PyPlot
mu, sigma = 100, 15
x = mu .+ sigma * randn(10000)
n, bins, patches = plt.hist(x, 50, density=1,
facecolor="green", alpha=0.75)
y = pdf.(Ref(Normal(mu, sigma)), bins);
plot(bins, y, "r--", linewidth=1)
xlabel("Smarts")
ylabel("Probability")
title(raw"$\mathrm{Histogram\ of\ IQ:}\ \mu=100,\ \sigma=15$")
axis([40, 160, 0, 0.03])
grid(true)