#This is a script to debug debarcer and figure out why it's taking to long to run

module load tools anaconda3/4.4.0


#group UMIs

python /home/projects/ku_10025/apps/debarcer/debarcer/debarcer.py group -o /home/projects/ku_10025/apps/debarcer/tests/out -r chr1:4776044-4780817 -c /home/projects/ku_10025/apps/debarcer/config/tim_config.ini

#Collapse
python /home/projects/ku_10025/apps/debarcer/debarcer/debarcer.py collapse -o /home/projects/ku_10025/apps/debarcer/tests/out -r chr1:4776044-4780817 -c /home/projects/ku_10025/apps/debarcer/config/tim_config.ini


#Call VCFs
python /home/projects/ku_10025/apps/debarcer/debarcer/debarcer.py call -o /home/projects/ku_10025/apps/debarcer/tests/out -r chr1:4776044-4780817 -f 1,2,5 -cf ./out/chr1:4776044-4780817.cons -id "test_run"







