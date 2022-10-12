import 'package:flu/product_model.dart';
import 'package:flu/review_model.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  final Product product;
  ReviewPage(this.product,{Key? key}) : super(key: key);

  List<ReviewModel> lsReviews = [
    ReviewModel("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU%22,%22Xx_kikoolol_xX", "Really nice article !", 1, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    ReviewModel("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU%22,%22Xx_kikoolol_xX", "nice article !", 2, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    ReviewModel("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU%22,%22Xx_kikoolol_xX", "good article !", 3, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
    ReviewModel("https://i.picsum.photos/id/420/80/80.jpg?hmac=eaI_ri0-1OUWUeml6X3gTo6y4CLGCyOlB_MIgMpbIbU%22,%22Xx_kikoolol_xX", "Really good article !", 5, "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Liste des avis de ce produit"),),
        body: Column(
            children: [
              ListView.builder(
                itemCount: lsReviews.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(lsReviews[index].profilPic),
                    title: Text(lsReviews[index].title),
                    subtitle: Text(lsReviews[index].avis),
                  );
                }
              )
            ]
        )
    );
  }
}

