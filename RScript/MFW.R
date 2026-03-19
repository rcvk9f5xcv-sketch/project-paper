library(stylo)

#MFW 200
stylo()

#MFW only stopwords
library(stopwords)

english_stopwords <- stopwords::stopwords("en")

stylo(analyzed.features = english_stopwords)
