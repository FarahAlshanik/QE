# Code Repository for: Proactive Query Expansion for Streaming Data Using External Sources

1. To break files into 15 minutes time interval

python break_files_15_minute.py  --query_input_files ./sorted.csv --output_files ./balt_break_all_tweet/

2.To detect emergent events using DEC

python dec_main_copy.py --input_folder ./break_police_15M/ --output_folder ./dec_vals/ 

3. To compute jaccard similarity to trigger the query expansion

python compute_jaccard.py  --input_folder ./dec_vals/  --output_file  ./emerging_windows.txt

4. To extract files that have emergent events based on the jaccard similarity

python extract_files.py --input_file  ./emerging_windows.txt  --output_folder ./lda_files/

4. To run LDA on the files that have emergent events 

python lda.py --input_folder ./lda_files  --output_folder ./lda_output/

5. Generate queries using only LDA words on time interval 16:

python generate_queries_lda.py --lda_top_20_keywords_file ./lda_output/file_16.txt --lda 20  --query_input_files ./balt_break_all_tweet/ --start_window 16 --query_output_directory ./lda_output2/ --n 2 --tweet_cnt_output_file ./lda_output2/query_lda2_tweet_count.txt

7. Generate queries using  LDA words and DEC words on time interval 16:

python generate_queries_dec.py --lda 20 --dec 5  --lda_top_20_keywords_file ./lda_output/file_16.txt  --dec_keyword_file ./dec_vals/ecentrality16.txt --query_input_files ./balt_break_all_tweet/  --start_window 16 --query_output_directory ./lda_dec_output2/ --n 2 --tweet_cnt_output_file  ./lda_dec_output2/query_lda_dec_tweet_count.txt

8. Generate queries using  LDA words, DEC words, and nearest neighbor words on time interval 16:

python generate_queries_vs.py  --lda 20 --dec 5  --number 3 --dec_keyword_file ./dec_vals/ecentrality16.txt --lda_top_20_keywords_file ./lda_output/file_16.txt  --query_input_files ./balt_break_all_tweet/  --start_window 16 --query_output_directory ./lda_dec_nearest/ --n 2 --tweet_cnt_output_file  ./lda_dec_nearest/query_lda_dec_nearest_tweet_count.txt

9. Generate queries using  LDA words, DEC words, and highest frequency words on time interval 16:

python generate_queries_co.py  --lda 20 --number 3  --lda_top_20_keywords_file ./lda_output/file_16.txt  --query_input_files ./balt_break_all_tweet/  --start_window 16 --query_output_directory ./lda_dec_freq/ --n 2 --tweet_cnt_output_file  ./lda_dec_freq/query_lda_dec_freq_tweet_count.txt


To run the full pipeline in all the intervals that have emergent events:

1. For queries generated using LDA words just type: bash generate_queries_lda.sh

2. For queries generated using LDA and DEC words: bash generate_queries_dec.sh

3. For queries generated using LDA words, DEC words, and nearest neighbor words: bash generate_queries_vs.sh

4. For queries generated using LDA words, DEC words, and highest frequency words: bash generate_queries_co.sh
