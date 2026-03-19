library(quanteda)
library(quanteda.textstats)

segment_folder <- "complete_texts_in_segments"

files <- list.files(segment_folder, pattern = "\\.txt$", full.names = TRUE)

lex_results <- data.frame()

for(f in files){
  
  autor <- strsplit(basename(f), "_")[[1]][1]
  
  text <- paste(readLines(f, encoding = "UTF-8"), collapse = " ")
  
  corp <- corpus(text)
  toks <- tokens(corp, remove_punct = TRUE, remove_symbols = TRUE)
  
  mattr_value <- as.numeric(textstat_lexdiv(toks, measure = "MATTR")$MATTR)
  
  lex_results <- rbind(lex_results,
                       data.frame(Autor = autor,
                                  Segment = basename(f),
                                  MATTR = mattr_value))
}

summary_results <- aggregate(MATTR ~ Autor, data = lex_results,
                             FUN = function(x) c(Mean = mean(x), SD = sd(x)))

summary_results <- do.call(data.frame, summary_results)
colnames(summary_results) <- c("Autor", "Mean_MATTR", "SD_MATTR")

dir.create("lexical_diversity", showWarnings = FALSE)

write.table(summary_results,
            file = "lexical_diversity/lexical_diversity.txt",
            sep = "\t",
            row.names = FALSE,
            quote = FALSE)

print(summary_results)




