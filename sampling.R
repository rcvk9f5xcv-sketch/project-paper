library(stylo)
stylo()


files <- list.files("sample_dump", pattern = "\\.txt$", full.names = TRUE)
set.seed(123)

tolkien_files <- files[grepl("Tolkien", files)]

fellowship <- tolkien_files[grepl("Fellowship", tolkien_files)]
tower <- tolkien_files[grepl("Tower", tolkien_files)]
king <- tolkien_files[grepl("King", tolkien_files)]
hobbit <- tolkien_files[grepl("Hobbit", tolkien_files)]

tolkien_selection <- c(
  sample(fellowship, 2),
  sample(tower, 2),
  sample(king, 2),
  sample(hobbit, 2)
)


paolini_files <- files[grepl("Paolini", files)]

eragon <- paolini_files[grepl("Eragon", paolini_files)]
eldest <- paolini_files[grepl("Eldest", paolini_files)]
brisingr <- paolini_files[grepl("Brisingr", paolini_files)]
inheritance <- paolini_files[grepl("Inheritance", paolini_files)]

paolini_selection <- c(
  sample(eragon, 2),
  sample(eldest, 2),
  sample(brisingr, 2),
  sample(inheritance, 2)
)


rowling_files <- files[grepl("Rowling", files)]

sorcerer <- rowling_files[grepl("Sorcerer", rowling_files)]
chamber <- rowling_files[grepl("Chamber", rowling_files)]
azkaban <- rowling_files[grepl("Azkaban", rowling_files)]
goblet <- rowling_files[grepl("Goblet", rowling_files)]
order <- rowling_files[grepl("Order", rowling_files)]
halfblood <- rowling_files[grepl("Halfblood", rowling_files)]
hallows <- rowling_files[grepl("Hallows", rowling_files)]

rowling_selection <- c(
  sample(sorcerer, 1),
  sample(chamber, 1),
  sample(azkaban, 1),
  sample(goblet, 1),
  sample(order, 1),
  sample(halfblood, 1),
  sample(hallows, 1)
)

remaining <- setdiff(rowling_files, rowling_selection)
rowling_selection <- c(rowling_selection, sample(remaining, 1))


lewis_files <- files[grepl("Lewis", files)]

magician <- lewis_files[grepl("Magician", lewis_files)]
wardrobe <- lewis_files[grepl("Wardrobe", lewis_files)]
caspian <- lewis_files[grepl("Caspian", lewis_files)]
voyage <- lewis_files[grepl("Voyage", lewis_files)]
chair <- lewis_files[grepl("Chair", lewis_files)]
horse <- lewis_files[grepl("Horse", lewis_files)]
battle <- lewis_files[grepl("Battle", lewis_files)]

lewis_selection <- c(
  sample(magician, 1),
  sample(wardrobe, 1),
  sample(caspian, 1),
  sample(voyage, 1),
  sample(chair, 1),
  sample(horse, 1),
  sample(battle, 1)
)

remaining <- setdiff(lewis_files, lewis_selection)
lewis_selection <- c(lewis_selection, sample(remaining, 1))


final_selection <- c(
  tolkien_selection,
  paolini_selection,
  rowling_selection,
  lewis_selection
)

dir.create("analyse_corpus")
file.copy(final_selection, "analyse_corpus")





