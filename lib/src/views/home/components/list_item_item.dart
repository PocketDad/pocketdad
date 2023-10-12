import 'package:flutter/material.dart';
import 'package:pocketdad/src/data_models/item_db.dart';
import '../../../data_models/user_db.dart';

class ListItemItem extends StatelessWidget {
  const ListItemItem(this.itemID, {super.key});
  final String itemID;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
            width: 300,
            height: 200,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  ItemDB().getItem(itemID).name,
                                  style:
                                  const TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                            ]
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (ItemDB().getItem(itemID).icon != "")
                              SizedBox(height: 80, child: Image.asset(ItemDB().getItem(itemID).icon),),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (ItemDB().getAssociatedUsers(itemID).isNotEmpty)
                                const Text(
                                    textAlign: TextAlign.center,
                                    'Assigned users: ',
                                    style:
                                    TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                    )
                                ),
                              for (var i = 0; i < ItemDB().getAssociatedUsers(itemID).length; i++)
                                Text(
                                    textAlign: TextAlign.center,
                                    '${UserDB().getUser(ItemDB().getAssociatedUsers(itemID)[i]).name} ',
                                    style:
                                    const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                    )
                                ),
                            ]
                        ),
                      ]
                  ),
                  const Spacer(),
                ])
                )
        ),
      );
  }
}

final List<ItemData> items = [
  ItemData(
    id: 'item-001',
    name:  'Car',
    userIDs: ['user-001', 'user-002'],
    icon: "assets/images/car.png",
  ),
  ItemData(
    id: 'item-002',
    name:  'House',
    userIDs: [],
    icon: "",
  ),
  ItemData(
    id: 'item-003',
    name:  'Condo',
    userIDs: [],
    icon: "",
  ),
];