############# Great circles exercise ####################
#### Based on Flowing Data tutorial and code
#### "How to map connections with great circles"
#### http://flowingdata.com/ 

### Data: Argentina's bilateral diplomatic agreements 1911 - 1999
### Source: http://worldtreatyindex.com/
### Date: 20.12.2011

#setwd()

library(maps)
library(geosphere)

data<-read.csv("Documentos/WTI3.csv", header=T)

# Hay que ordenar los datos de modo que las líneas de los paises 
# con mayor número de acuerdos se dibujen al final
data<-data[order(data$Number),]

pal <- colorRampPalette(c("#333333","white"))
colors <- pal(100)
maxcnt <- max(data$Number)

par(mai= c(0,0,0,0),xaxs = "i", yaxs = "i")
png("world.png", width=2048, heigh=2048, units="px")
mapa<- map("world", lwd=1,col="#191919", fill=T, bg="#000000")
for (j in row(data)) 
{
inter <- gcIntermediate(c(-58.38, -34.60), 
c(data$long[j], data$la[j]), n=100, addStartEnd=T)
colindex <- round( (data[j,]$Number/maxcnt) * length(colors) )
lines(inter, lwd=0.8, col=colors[colindex])
}

dev.off()
