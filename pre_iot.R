# Filtrando o data frame original para conter apenas os paciente que usaram CNAF
# ou VNI pré IOT.
df_pre <- filter(df, `Usou VNI pre IOT?` == "Yes" | `Usou CNAF pre IOT?` == "Yes")
df_pre %>% mutate(Grupo = "Int")
df_pre$Grupo <- c("Int")
df_npre$Grupo <- c("Controle")
df_pret <- rbind(df_pre, df_npre)
df_pret["Grupo"]
unique(df_pret[c("Grupo")])

df_pret %>% group_by("Grupo") %>% wilcox.test(df_pret$Idade)
#Análise de idade