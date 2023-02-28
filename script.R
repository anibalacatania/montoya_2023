library(agricolae)


resultados<-readxl::read_excel("Resumen_datos.xlsx")
str(resultados)
resultados$Tratamiento<-as.factor(resultados$Tratamiento)
resultados$Profundidad<-as.factor(resultados$Profundidad)
resultados$raiz<-as.factor(resultados$raiz)
# Ajustar modelo de ANOVA
modelo <- lm(Longitud ~ Tratamiento + Profundidad+raiz+Tratamiento:Profundidad+Profundidad:raiz+Tratamiento:raiz, data = resultados)

anova(modelo)


out<-LSD.test(modelo,"Tratamiento",p.adj="hommel",console=TRUE)
out<-LSD.test(modelo,"raiz",p.adj="hommel",console=TRUE)
