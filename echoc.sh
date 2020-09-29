#!/bin/bash

echo "#!/bin/sh\necho \"\\e[101m\\e[30m\$1\\e[0m\"" > /bin/echored
echo "#!/bin/sh\necho \"\\e[104m\\e[30m\$1\\e[0m\"" > /bin/echoblue
echo "#!/bin/sh\necho \"\\e[42m\\e[30m\$1\\e[0m\"" > /bin/echogreen

chmod +x /bin/echogreen
chmod +x /bin/echored
chmod +x /bin/echoblue
