















# Questão 5

library(dplyr)

dados <- starwars |> 
  select(name, height, mass, hair_color, eye_color, sex, species) |> 
  filter(!is.na(hair_color), !is.na(mass)) 

dados |> 
  arrange(desc(height)) |> 
  group_by(sex) |> 
  summarise(
    media_altura = mean(height, na.rm = TRUE),
    media_massa = mean(mass, na.rm = TRUE),
    n = n()
  )

dados |> 
  arrange(desc(height)) |> 
  group_by(sex) |> 
  summarise(
    across(
      .cols = where(is.numeric),
      .fns = c(\(x) mean(x, na.rm = TRUE), \(x) median(x, na.rm = TRUE))
    )
  ) |> 
  rename("sexo" = sex)