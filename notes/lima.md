Stand 13. März 2024 (dürftig)

# Spicker Lima


Achtung innerhalb ipython funktioniert (plötzlich) auch %pip⁠

```
limactl --help  

limactl -h    

limactl create --name=default template://docker
limactl pull kalilinux/kali-rolling 

limactl create kalilinux/kali-rolling

limactl edit 
limactl status    
limactl snapshot create default --tag julia1
limactl snapshot list default
limactl stop     
limactl start    
limactl list            
limactl list | grep run
limactl list | grep Stop  


lima
lima bash  # startet die bash
lima ipython3 # startet ipython3 nachdem es installiert wurde
lima ipython speedneu.py  # und exit

lima ps # list prozesse innerhalb lima und exit wenn fertig
lima uptime --pretty  


python3 --version
sudo apt install python3-pip
sudo apt install ipython3
sudo apt install python3-pandas
ipython3
python3 speedneu.py
history >erstelimainstall.txt


ls -a1
ls .lima
cd .lima
ls
ls _config/
ls _config/user
ls default/
ls _config/
cd _config/
ls
cat user
cat networks.yaml
```






