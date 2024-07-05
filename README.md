# partiel-ias

FLORENT DUROT

1/ Créer du code Terraform permettant de provisionner une VM avec une adresse IP publique
- Nous commençons par activer l'API "Compute Engine" sur notre plateforme Cloud en l'occurence GCP pour notre cas
- Nous créons le compte de service "terraform" qui va servir de passerelle pour créer automatiquement notre VM
- Ensuite, nous créons deux fichiers sur notre machine local. "providers.tf" et "main.tf"
- Le premier fichier "providers.tf" va contenir notre clé JSON, notre nom de projet et notre région.
- Le second fichier "main.tf" va contenir le code permettant la création de notre VM, son nom, son type de machine, sa zone, son image d'OS et sa configuration réseau (ip publique)
- Ensuite, nous sauvegardons ces fichiers puis nous faison un "terraform init" qui nous permet comme son nom l'indique, d'intialiser la configuration, puis un "terraform plan" qui nous montre les modifications qui vont être apportées, puis un "terraform apply" pour créer la VM.

2/ Créer un playbook Ansible pour installer une application
- Nous créons deux fichiers, un fichier "install_app.yml" et un fichier "hosts.yml"
- Le premier servira à renseigner toute notre configuration pour installer l'application
- Le second servira à spécifier où nous voulons l'installer et quel est l'utilisateur associé à l'IP
- Ensuite, nous exécutons cette commande pour installer l'application : ansible-playbook -i hosts install_app.yml
