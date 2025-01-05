#Оригинал -- https://github.com/tanersolak/zenity_project
#Адаптировано RU by  ★ el guahiro ★
ans= $(zenity --info --title "Табло информации о системе" \
       --width 500 \
	--height 100 \
	--text "Чувак, тут всё о системе, заходи сюда" \
)

rc=1 
while [ $rc -eq 1 ]; do

  secim=$( zenity --info --title 'Информация' \
  	 --width 500 \
  	 --height 200 \
	 --text 'Выберите нужный параметр' \
	 --ok-label 'Выход' \
	 --extra-button 'uname -a' \
	 --extra-button 'lscpu' \
	 --extra-button 'lspci' \
	 --extra-button 'lsscsi' \
	 --extra-button 'mount | column -t' \
	)
	
  rc=$?
  
  echo $secim	
  
  if [[ $secim = 'uname -a' ]]
  then
	echo "uname -a стартует"
	echo "##########################################"
	uname -a
	
	sleep 1
  elif [[ $secim = 'lscpu' ]]
  then
	  echo "lscpu стартует"
	  echo "##########################################"
	  lscpu
	  sleep 1
	  	
  elif [[ $secim = 'lspci' ]]
  then
	  echo "lspci стартует"
	  echo "##########################################"
	  lspci
	  sleep 1
  elif [[ $secim = 'lsscsi' ]]
  then
	  echo 'lsusb стартует'
	  echo "##########################################"
	  lsusb  	
	  sleep 1	
  elif [[ $secim = 'mount | column -t' ]]
  then
	  echo "mount | column -t стартует"
	  echo "##########################################"
	  mount | column -t  
	  sleep 1
	fi
done
	  	
