# query-construction

1. To break files into 15 minutes time interval

python ./break_files_15_minute.py  --query_input_files ./sorted.csv --output_files ./balt_break_all_tweet/


#2. initiate stream using static keyword "police"

#python --query_input_files ./balt_break_all_tweet/  --output_files ./break_police_15M/

3.To detect emergent events using DEC

python dec_main_copy.py --input_folder ./break_police_15M/ --output_folder /zfs/dicelab/farah/Baltimore/dec_vals_new2/ 

4. To compute jacard similarity to trigger the query expansion

python compute_jaccard.py  --input_folder /zfs/dicelab/farah/Baltimore/dec_vals_new2/  --output_file  /zfs/dicelab/farah/Baltimore/jac/emerging_windows.txt


5. To extract the files that have emergent events based on the jaccard similarity

python extarct_files.py --input_file  /zfs/dicelab/farah/Baltimore/jac/emerging_windows.txt  --output_folder /zfs/dicelab/farah/Baltimore/lda_files/


5. To run LDA on the files that have emergent events 

python lda.py --input_folder /zfs/dicelab/farah/Baltimore/lda_files  --output_folder /zfs/dicelab/farah/Baltimore/lda_output/

6. Generate queries using only lda topic modeling keywords:

python generate_queries_lda.py --lda_top_20_keywords_file /zfs/dicelab/farah/Baltimore/lda_output/file_16.txt --lda 20  --query_input_files /zfs/dicelab/farah/balt_break_all_tweet/ --start_window 16 --query_output_directory /zfs/dicelab/farah/query_exp/query-construction2/lda_output2/ --n 2 --tweet_cnt_output_file /zfs/dicelab/farah/query_exp/query-construction2/lda_output2/query_lda2_tweet_count.txt


7. Generate queries using  lda topic modeling keywords and DEC words:

python generate_queries_dec.py --lda 20 --dec 5 --word_vectors_voc_file Baltimore/dec_lda_keywords.vec --lda_top_20_keywords_file /zfs/dicelab/farah/Baltimore/lda_output/file_16.txt  --dec_keyword_file /zfs/dicelab/farah/Baltimore/dec_vals_new2/ecentrality16.txt --query_input_files /zfs/dicelab/farah/balt_break_all_tweet/  --start_window 16 --query_output_directory /zfs/dicelab/farah/query_exp/query-construction2/lda_dec_output2/ --n 2 --tweet_cnt_output_file  /zfs/dicelab/farah/query_exp/query-construction2/lda_dec_output2/query_lda_dec_tweet_count.txt


8. Generate queries using  lda topic modeling keywords, DEC words, and nearest neighbor words:

python generate_queries_vs.py  --lda 20 --number 3  --lda_top_20_keywords_file /zfs/dicelab/farah/Baltimore/lda_output/file_16.txt  --query_input_files /zfs/dicelab/farah/balt_break_all_tweet/  --start_window 16 --query_output_directory /zfs/dicelab/farah/query_exp/query-construction2/lda_dec_nearest/ --n 2 --tweet_cnt_output_file  /zfs/dicelab/farah/query_exp/query-construction2/lda_dec_nearest/query_lda_dec_freq_tweet_count.txt

9. Generate queries using  lda topic modeling keywords, DEC words, and nearest neighbo words:

python generate_queries_co.py  --lda 20 --number 3  --lda_top_20_keywords_file /zfs/dicelab/farah/Baltimore/lda_output/file_16.txt  --query_input_files /zfs/dicelab/farah/balt_break_all_tweet/  --start_window 16 --query_output_directory /zfs/dicelab/farah/query_exp/query-construction2/lda_dec_freq/ --n 2 --tweet_cnt_output_file  /zfs/dicelab/farah/query_exp/query-construction2/lda_dec_freq/query_lda_dec_freq_tweet_count.txt
