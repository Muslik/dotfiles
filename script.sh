#COLORS

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BLUE='\033[0;34m'
CYAN='\033[0;49;36m'

#VARIABLES
FILENAME=${1:-"reactApp"}

echo "\nHello ${BLUE}Dzhabrail${NC}!\n"
echo "Creating a new React app in ${GREEN}${PWD/#$HOME/~}/$FILENAME${NC}.\n"
git clone https://gitlab.com/Dzhab/reacttemplate.git ${FILENAME} &> /dev/null
echo "Installing packages. This might take a couple of minutes.\n"
cd ${FILENAME} && yarn install
rm -rf ".git"
echo "\nInitialized a git repository\n"
git init &> /dev/null
cd ..
echo "Success! Created ${FILENAME} at ${PWD}/${FILENAME}"
echo "Inside that directory, you can run several commands:\n"
echo "  ${CYAN}yarn start${NC}"
echo "    Starts the development server"
echo "  ${CYAN}yarn build${NC}"
echo "    Bundles the app into static files for production\n"
echo "We suggest that you begin by typing:\n\n"
echo "  ${CYAN}cd${NC} ${FILENAME}"
echo "  ${CYAN}yarn start${NC}\n"
echo "Happy hacking!"
