colnames(df)
nrow(df) ## 1086 pacientes

## Summary statistics
skim(df)

## Sexo

df %>% ggplot(aes(x=Sexo, y= (..count..)/sum(..count..)*100, fill=Sexo)) + 
  geom_bar() +
  ggtitle("Distribuição de sexo entre os pacientes") +
  labs(y="Quantidade de pacientes (%)")

ggplot(data=df, aes(x=Sexo, y= (..count..)/sum(..count..)*100, fill=Sexo)) + 
  geom_bar() +
  ggtitle("Distribuição de sexo entre os pacientes") +
  labs(y="Quantidade de pacientes (%)")
# Idade

skim(df$Idade)

shapiro.test(df$Idade) # W = 0.98431, p-value = 2.025e-09

df %>% ggplot(aes())+
  geom_density(aes(Idade), fill="blue") # Left skewed

# Diferença de tempo entre início dos sintomas e internação hospitalar
mean(df$`Data do início dos sintomas` - df$`Data de admissão hospitalar no HC`)/(24*60*60)

# Escala de Glasgow
skim(df$`Escala da Glasgow na primeira hora da admissão na UTI`)

shapiro.test(df$`Escala da Glasgow na primeira hora da admissão na UTI`)

ggplot(data=df, aes(x=`Escala da Glasgow na primeira hora da admissão na UTI`, y=(..count..)/sum(..count..)*100), fill="blue") +
  geom_bar() +
  labs(x="Escala de coma de Glasgow", y="Porcentagem de pacientes") +
  scale_x_continuous(name="Escala de coma de Glasgow", breaks=c(3, 6, 9, 12, 15), limits=c(2,16)) +
  scale_y_continuous(name="Porcentagem de pacientes", breaks=c(0, 10, 20, 30, 40, 50, 60))
