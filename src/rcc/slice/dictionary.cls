Class rcc.slice.dictionary Extends %Text.Text
{
/// inspired by %Text.Japanese
/// 1 char = word
Parameter SEPARATEWORDS = 1;
/// max. word by Ngram    
Parameter NGRAMLEN = 4;
Parameter MAXWORDLEN = 4;
Parameter MINWORDLEN = 1;
Parameter STEMMING = 0;
Parameter FILTERNOISEWORDS = 0;
Parameter MINLEN = 1;
Parameter MAXLEN = 32000;
Parameter DICTIONARY = 200;
}
