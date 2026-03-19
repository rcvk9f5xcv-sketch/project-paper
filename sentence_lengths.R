library(quanteda)
library(readtext)

folder <- "complete_texts"

corp <- corpus(readtext::readtext(paste0("~/Uni/dHum/Project/complete_texts/*.txt"), encoding = "UTF-8"))

corp_sentences <- corpus_reshape(corp, to = "sentences")

num_sentences <- ndoc(corp_sentences)

sentence_tokens <- tokens(corp_sentences, remove_punct = TRUE, remove_symbols = TRUE)

sentence_lengths <- ntoken(sentence_tokens)

mean_per_text <- tapply(sentence_lengths, docid(corp_sentences), mean)
sd_per_text <- tapply(sentence_lengths, docid(corp_sentences), sd)

results <- data.frame(
  Text = docnames(corp),
  Sentences = tapply(rep(1, length(sentence_lengths)), docid(corp_sentences), sum),
  Total_Words = tapply(sentence_lengths, docid(corp_sentences), sum),
  Mean_Sentence_Lengths = mean_per_text,
  SD_Sentence_Lengths = sd_per_text
)

write.table(results,
            file = "average_sentence_lengths/sentence_lengths.txt",
            sep = "\t",
            row.names = FALSE,
            quote = FALSE)
