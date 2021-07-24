import 'package:cash_manager/models/Cart.dart';
import 'package:flutter/material.dart';

class CardItemCard extends StatelessWidget {
  const CardItemCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset(cart.product.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.name,
              maxLines: 2,
            ),
            const SizedBox(height: 10,),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: " x${cart.numOfItems}",
                    style: TextStyle(color: Theme.of(context).textTheme.caption.color),
                  )
                ]
              )
            )
          ],
        )
      ],
    );
  }
}