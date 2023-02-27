# Se especifica la carpeta donde se encuentran los archivos de Excel
resultados<-readxl::read_excel("Mis documentos/INTA/SENSORIAL/PANEL/2023/montoya_2023/Resumen_datos.xlsx")
str(resultados)
resultados$Tratamiento<-as.factor(resultados$Tratamiento)
resultados$Profundidad<-as.factor(resultados$Profundidad)
resultados$raiz<-as.factor(resultados$raiz)
# Ajustar modelo de ANOVA
modelo <- lm(Longitud ~ Tratamiento + Profundidad+raiz+Tratamiento:Profundidad+Profundidad:raiz+Tratamiento:raiz, data = resultados)
modelo <- lm(Longitud ~ raiz, data = resultados)
summary(modelo)
# Realizar análisis de varianza
anova(modelo)
table(resultados$Profundidad, resultados$raiz)

# Mostrar resultados
print(anova_resultados)

# Mostrar resumen de resultados
summary(modelo)