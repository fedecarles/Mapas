############# Map Pies exercise ####################
#### Based on xingmowang's tutorial blog post and code####
#### http://nzprimarysectortrade.wordpress.com ####

### Data: Main Argentina's exports to latin america ###
### Source: INDEC ###
### Date: 20.12.2011

#setwd() 

data<-read.csv("Documentos/Ex_aladi_gr2010.csv", header=T)

par(mai= c(0,0,0.6,0),
    xaxs = "i",
    yaxs = "i")

png("expo2010.png", width=2048, heigh=2048)
mapPies(dF =data, mapRegion="world",
        nameX="long",
        nameY="lat",
        nameZs =c("Productos.primarios",
                  "Manufacturas.de.Origen.Agropecuario",
                  "Manufacturas.de.Origen.Industrial",
                  "Combustibles.y.energía"),
        zColours=c("red","green","blue","yellow"),
        oceanCol = "lightblue",
        symbolSize=4,
        landCol = "grey",
        addSizeLegend=F, borderCol="black",
        addCatLegend=F,
        xlim=c(-80,-70),
        ylim=c(-60,50))

title(main=paste("Exportaciones argentinas por país de destino - 2010"),
      cex=3)

legend(-125,-40,
       legend=c("Productos primarios",
                "Manufacturas de Origen Agropecuario",
                "Manufacturas Origen Industrial",
                "Combustibles y energía"),
       col=c("red","green","blue","yellow"),
       pch=16,
       cex=3,
       pt.cex=4,
       bty="n",
       box.lty=0,
       horiz = F,
       bg="#FFFFFF70")

dev.off()