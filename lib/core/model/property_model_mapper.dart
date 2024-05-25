import 'package:final_project/features/favorite/data/model/myfavorites_response.dart'
    as favorite;
import 'package:final_project/features/home_details/data/models/home_properties_response.dart'
    as home;

class PropertyModelMapper {
  home.Property getPropertyModel(favorite.Property favorite) {
    return home.Property(
      owner: home.User(
        email: favorite.owner?.email,
        name: favorite.owner?.name,
        id: favorite.owner?.id,
        password: favorite.owner?.password,
        phone: favorite.owner?.phone,
        role: favorite.owner?.role,
      ),
      address: favorite.address,
      approved: favorite.approved,
      area: favorite.area,
      bathrooms: favorite.bathrooms,
      id: favorite.id,
      bedrooms: favorite.bedrooms,
      city: home.City(
        id: favorite.city?.id,
        nameAr: favorite.city?.nameAr,
        nameEn: favorite.city?.nameEn,
      ),
      description: favorite.bedrooms,
      images: favorite.images,
      name: favorite.name,
      price: favorite.price,
    );
  }

}
