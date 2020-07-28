class Business{
  String name;
  String about;
  String contact;
  String tag;
  String owner; 


Business (
  {
    String name, 
    String about, 
    String contact,
    String tag, 
    String owner
    }
    )

    {
      this.name = name;
      this.about = about;
      this.contact = contact;
      this.tag = tag;
      this.owner = owner;
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

}