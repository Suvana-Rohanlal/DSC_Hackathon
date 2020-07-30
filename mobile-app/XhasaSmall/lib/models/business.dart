class Business{
  String name;
  String about;
  String contact;
  String tag;
  String owner; 
  List <String> products;
  String url;


Business (
  {
    String name, 
    String about, 
    String contact,
    String tag, 
    String owner,
    List <String> products,
    String url,
    }
    )

    {
      this.name = name;
      this.about = about;
      this.contact = contact;
      this.tag = tag;
      this.owner = owner;
      this.products = products;
      this.url = url ?? " ";
    }

    String getName(){
      return this.name;
    }
    
    String getAbout(){
      return this.about;
    }

    String getTag(){
      return this.tag;
    }

    String getOwner(){
      return this.owner;
    }

    String getContact(){
      return this.contact;
    }

    String getImage() {

      String other = "Other";

      
      if (this.getName() == "The Bean Water Company")
        return "https://img.icons8.com/doodle/100/000000/coffee-beans-.png";
      
      else if (this.getTag() == other) {
        return "https://img.icons8.com/plasticine/100/000000/service.png";
      }
      else if (this.getTag() == "Fashion") {
        return "https://img.icons8.com/plasticine/100/000000/shop.png";      }
      else if (this.getTag() == "Education") {
        return "https://img.icons8.com/officel/80/000000/university.png";
      }
      else if (this.getTag() == other) {
        return "https://img.icons8.com/plasticine/100/000000/service.png";
      }
      else if (this.getTag() == "Restaurant") {
        return "http://www.clker.com/cliparts/2/2/e/b/11970886191802263177Gerald_G_Fast_Food_menu_samples_(FF_Menu)_5.svg.med.png";
      }
      else if (this.getTag() == "Fitness") {

        return "http://www.clker.com/cliparts/X/n/3/y/1/T/gym-md.png";
      }
      else if (this.getTag() == "Retail") {
        return "https://img.icons8.com/plasticine/100/000000/shop.png";
      }
      return this.getImage2();
    }

    String getImage2(){
      
      String other = "Other";

      if (this.getName() == "C-137 Clothing")
        return "http://www.pngall.com/wp-content/uploads/4/Rick-And-Morty.png";
      else if (this.getName() == "Zamalek") {
        return "https://i.colnect.net/f/4283/802/Carling-Black-Label-Beer.jpg";
      }

      if (this.getName() == "The Bean Water Company")
        return "https://img.icons8.com/doodle/100/000000/coffee-beans-.png";
      else if (this.getName() == "[array] Software Solutions") {
        return "https://media-exp1.licdn.com/dms/image/C5616AQFFDnRGrxJkaA/profile-displaybackgroundimage-shrink_200_800/0?e=1601510400&v=beta&t=BLslHSoBDacoo1zn-pLncD8lDpIpaPkfunBUMpdJkXA";
      }
      else if (this.getTag() == other) {
        return "https://img.icons8.com/plasticine/100/000000/service.png";
      }
      else if (this.getTag() == "Fashion") {
        return "https://img.icons8.com/plasticine/100/000000/shop.png";      }
      else if (this.getTag() == "Education") {
        return "https://img.icons8.com/officel/80/000000/university.png";
      }
      else if (this.getTag() == other) {
        return "https://img.icons8.com/plasticine/100/000000/service.png";
      }
      else if (this.getTag() == "Restaurant") {
        return "http://www.clker.com/cliparts/2/2/e/b/11970886191802263177Gerald_G_Fast_Food_menu_samples_(FF_Menu)_5.svg.med.png";
      }
      else if (this.getTag() == "Fitness") {

        return "http://www.clker.com/cliparts/X/n/3/y/1/T/gym-md.png";
      }
      else if (this.getTag() == "Retail") {
        return "https://img.icons8.com/plasticine/100/000000/shop.png";
      }
      return this.getImage2();
    }


}