 #!/bin/bash
#by el guahiro, 79201111365@yandex.ru
#GPLv3 (GNU General Public License Version 3)
sensors | grep -i fan | cut -c14-18 |tr -d "\r\n"