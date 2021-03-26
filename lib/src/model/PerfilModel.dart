class PerfilModel {
  int restaurantid;
  String nome;
  String endereco;
  String lat;
  String lng;
  String img;

  PerfilModel(
      {this.restaurantid,
      this.nome,
      this.endereco,
      this.lat,
      this.lng,
      this.img});

  PerfilModel.fromJson(Map<String, dynamic> json) {
    restaurantid = json['restaurantid'];
    nome = json['nome'];
    endereco = json['endereco'];
    lat = json['lat'];
    lng = json['lng'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantid'] = this.restaurantid;
    data['nome'] = this.nome;
    data['endereco'] = this.endereco;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['img'] = this.img;
    return data;
  }
}
