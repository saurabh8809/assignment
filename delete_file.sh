if [[ "${UID}" -eq 0 ]]
then
  echo ' '
  echo 'You are root.'
else
  echo 'You are not root please run the script with root privilege.'
  exit 1
fi

mkdir -p /home/ubuntu/audios/logs/
file="/home/ubuntu/audios/file_list"
find /home/ubuntu/audios/ -type f -mtime +2  -name "audio*.wav" | sort > /home/ubuntu/audios/file_list
DATE=`date "+%h-%d-%Y-%H-%M-%S"`
while IFS= read -r file
do 
	echo "${file}" "$(stat -c "%x" ${file})"  "$(date --iso-8601=seconds)" >> /home/ubuntu/audios/logs/deleted-files-${DATE}.log
	rm -f ${file}
done < ${file}
rm -f /home/ubuntu/audios/file_list
sed -i 's|/home/ubuntu/audios/||g' /home/ubuntu/audios/logs/deleted-files-${DATE}.log

