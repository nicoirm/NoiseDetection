
# each remote microphone should feed in data in blocks of 1 column integers into ./noise_data, constantly, with a certain time interval. 

# this fetches the data available in ./noise_data (at least 2 data blocks from the 2 different remote microphones). 

# runs the average calculations with mean_calc_data_block.cc (a separate number of instances equal to the number of data blocks available). 

# if the number of data block changes, this should be handled dynamically automatically (e.g., if a remote microphone fails of gets disconnected).

# after analysis the data are stored with a time tag in ./data_backup 



mkdir noise_data
mkdir data_backup
g++ mean_calc_data_block.cc -o mean_calc_data_block


while true; 
do 

date=$(date | sed 's/ /_/g')
str1=""

c=0
for f in ./noise_data/data_mic_*.dat
do
str1=$str1$(printf "+ %f " $(./mean_calc_data_block $f) )
c=$(($c+1))

# move old data to ./data_backup with a time tag 
cp $f $f-$date 
mv $f-$date ./data_backup/ 

done
# echo $str1 

# this is the average between the different remote microphones averages:
mean=$(echo $str1 | sed 's/+ //' | bc -l | awk '{print $1/'"$c"'}')
# echo $mean

# this is the population standard deviation:
std=$(echo $str1 | sed 's/+ /sqrt( ( (/'  | sed 's/ + \|$/ - '"$mean"')^2 + (/g' | sed 's/ + ($/ )\/'$c' ) /' | bc -l) 
# echo $std

# check if a microphone reports levels higher than 1 std with respect to the overall average
echo $str1 | sed 's/+//'  | sed 's/+/\n/g' | awk '{printf "mic_%i %f \n",mic_idx++,$1}' | awk '{if($2> ('"$mean"' + '"$std"') ){print $1,$2, "too loud !"}}'


sleep 2 # refresh rate
done


