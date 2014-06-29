Buna ziua,

O noua sesizare a fost facuta de catre <%= @trouble.author %> in orasul <%= @trouble.city.name %> prin intermediul site-ului eProblema.ro. Detalii:

Nume: <%= @trouble.name %>
Descriere: <%= @trouble.description %>
Data raportarii: <%= @trouble.created_at %>
Locatia exacta(latitudine/longitudine): <%= @trouble.latitude %> / <%= @trouble.longitude %>
<%= link_to "Link-ul sesizarii cu alte detalii, poze si comentarii", trouble_path(@trouble) %>

Va multumim! 
