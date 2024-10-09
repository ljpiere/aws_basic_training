# Usaremos Ubuntu como AMI

# Ingresamos a nuestra instancia
ssh -i "key.pem" ec2-user@<your-ec2-public-ip>

# Instalamos dependencias
sudo apt update -y
sudo apt upgrade -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
sudo apt install git

python3 -m venv ml-env
source ml-env/bin/activate

pip install --upgrade pip
pip install scikit-learn
pip install joblib

# Podemos saltarnos esto si copiamos del repo el archivo
nano simple_ml.py

git --version
git clone https://github.com/ljpiere/aws_basic_training.git
cd aws_basic_training/ec2_ml
python3 simple_ml.py

