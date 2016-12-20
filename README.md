# Plataforma de Contrataciones Abiertas
Tablero con gráficas y visualizaciones de información de Contrataciones Abiertas. Proyectos incluidos:
- NAICM
- Red Compartida
- Puertos Abiertos

## Instalación
Instrucciones para instalar la Plataforma de Contrataciones Abiertas

### Dependencias 
1. Base de datos PostgreSQL >= 9.4 
2. NodeJS v6 o posterior 

### Restauración de la base de datos 
1. `create database edca;`
2. `create user tester with password 'test';`
3. `grant all privileges on database edca to tester;`
4. `psql -U tester edca < sql/edcadb_yyyymmdd.sql`
5. `psql -U tester edca < sql/links.sql`

### Aplicación Web
1. `git clone https://github.com/mxabierto/edca-dashboard.git`
2. `cd edca-dashboard/ && npm install`
3. `cd public/ && bower install`
    
## Ejecución
1. `cd edca-dashboard/ && npm start`
2. A través de un navegador web, apuntar a la siguiente dirección: 
`http://localhost:4000/contratacionesabiertas/`