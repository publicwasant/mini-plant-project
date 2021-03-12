import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mp_v1_0/controllers/redirect/redirect.dart';

import 'package:mp_v1_0/controllers/product/product-bar.dart';
import 'package:mp_v1_0/controllers/product/product-item.dart';
import 'package:mp_v1_0/models/product-model/product-model.dart';

class ProductsPage extends StatefulWidget {
  dynamic data;

  ProductsPage ({dynamic data}) {
    this.data = data;
  }

  @override
  State <StatefulWidget> createState() {
    return _ProductsPageState(data: this.data);
  }
}

class _ProductsPageState extends State<ProductsPage> {
  dynamic data;

  ProductBar productBar;
  
  ProductItem productItem1;
  ProductItem productItem2;
  ProductItem productItem3;
  ProductItem productItem4;

  _ProductsPageState ({dynamic data}) {
    this.data = data;

    productBar = new ProductBar(
      title: 'สินค้าแนะนำ',
      itemSize: 'small',
      onTap: (ProductItem item) async {
        Redirect(this.context, '/products/detail', data: {
          'option': 0,
          'productModel' : item.productModel
        });
      },
      items: <ProductItem> [
        ProductItem(new ProductModel(
          id: 0,
          title: 'Hot Sale Fruncata Cooperi Mini กุหลาบหินนำเข้า ไม้อวบน้ำ Live Succulent Plant ราคาถูก ต้นไม้ ไม้ ประดับ ต้นไม้ ประดับ พรรณ ไม้',
          type: 'สินค้าสำเร็จรูป',
          size: ['S'],
          detail: 'Hot Sale Fruncata Cooperi Mini กุหลาบหินนำเข้า ไม้อวบน้ำ Live Succulent Plant ราคาถูก ต้นไม้ ไม้ ประดับ ต้นไม้ ประดับ พรรณ ไม้',
          status: 'ยกเลิกการขาย',
          price: 272,
          discount: 0.23,
          total: 15,
          imgsURL: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIHW9vqYk8N-V1T1_NeL_ZX0sCpFJ56-_uRA&usqp=CAU',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 1,
          title: 'Hot Sale Senecio Rowleyanus Mini Buddha Pearl 4-5cm G Succulents กุหลาบหินนำเข้า ไม้อวบน้ำ.Imported Live Succulents plant ราคาถูก ต้นไม้ ไม้ ประดับ ต้นไม้ ประดับ พรรณ ไม้',
          type: 'สินค้าสำเร็จรูป',
          size: ['M'],
          detail: 'Hot Sale Senecio Rowleyanus Mini Buddha Pearl 4-5cm G Succulents กุหลาบหินนำเข้า ไม้อวบน้ำ.Imported Live Succulents plant ราคาถูก ต้นไม้ ไม้ ประดับ ต้นไม้ ประดับ พรรณ ไม้',
          price: 218,
          total: 33,
          imgsURL: [
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIHW9vqYk8N-V1T1_NeL_ZX0sCpFJ56-_uRA&usqp=CAU',
          ]
        )),
        ProductItem(new ProductModel(
          id: 2,
          title: 'Hot Sale Mini Plant ลิ้นมังกรแคระ กระถาง 4 นิ้ว ราคาถูก ต้นไม้ ไม้ ประดับ ต้นไม้ ประดับ พรรณ ไม้',
          type: 'สินค้าสำเร็จรูป',
          size: ['M'],
          detail: 'Hot Sale Mini Plant ลิ้นมังกรแคระ กระถาง 4 นิ้ว ราคาถูก ต้นไม้ ไม้ ประดับ ต้นไม้ ประดับ พรรณ ไม้',
          price: 230,
          discount: 0.10,
          total: 78,
          imgsURL: [
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIHW9vqYk8N-V1T1_NeL_ZX0sCpFJ56-_uRA&usqp=CAU'
          ]
        )),
        ProductItem(new ProductModel(
          id: 3,
          title: 'เมล็ดดอกไม้สวย 100pcs/bag Mixed Lithops Seeds Rare Succulent Seeds Ass Flower Seeds Pseudotruncatella Living Stone Bonsai Mini Garden Plant ต้นไม้มงคล ต้นไม้ประดับ ต้นไม้มงคลแคระ ต้นไม้จิ๋วจริง ดอกไม้ปลูก บอนไซ ผักสวนครัว เมล็ดพันธุ์พืช',
          type: 'สินค้าสำเร็จรูป',
          size: ['S', 'M'],
          detail: 'เมล็ดดอกไม้สวย 100pcs/bag Mixed Lithops Seeds Rare Succulent Seeds Ass Flower Seeds Pseudotruncatella Living Stone Bonsai Mini Garden Plant ต้นไม้มงคล ต้นไม้ประดับ ต้นไม้มงคลแคระ ต้นไม้จิ๋วจริง ดอกไม้ปลูก บอนไซ ผักสวนครัว เมล็ดพันธุ์พืช',
          status: 'สินค้าหมด',
          price: 219,
          discount: 0.57,
          total: 99,
          imgsURL: [
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 4,
          title: 'Senecio Rowleyanus Mini Buddha Pearl 4-5cm G Succulents กุหลาบหินนำเข้า ไม้อวบน้ำ.Imported Live Succulents plant',
          type: 'สินค้าสำเร็จรูป',
          size: ['M'],
          detail: 'Senecio Rowleyanus Mini Buddha Pearl 4-5cm G Succulents กุหลาบหินนำเข้า ไม้อวบน้ำ.Imported Live Succulents plant',
          price: 160,
          discount: 0.50,
          total: 56,
          imgsURL: [
            'https://th-test-11.slatic.net/p/bef0a4e6e969f14563a6f62a5f3bb0ce.jpg',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 5,
          title: 'Crassula oblique "Gollum" Single 2 Inch G Succulents กุหลาบหินนำเข้า ไม้อวบน้ำ',
          type: 'สินค้าสำเร็จรูป',
          size: ['M', 'L'],
          detail: 'Crassula oblique "Gollum" Single 2 Inch G Succulents กุหลาบหินนำเข้า ไม้อวบน้ำ',
          price: 130,
          discount: 0.69,
          total: 21,
          imgsURL: [
            'https://th-test-11.slatic.net/p/5c923ca62aec98d9d40a14e00d096e16.jpg_720x720q80.jpg_.webp',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 6,
          title: 'ระถางต้นไม้หลากสีขนาด 10*10 ซม.Succulent and Cactus Plants Flower Pot Home Desk Garden Decor Size 10*10 cm',
          type: 'กระถาง',
          size: ['S', 'M'],
          detail: 'ระถางต้นไม้หลากสีขนาด 10*10 ซม.Succulent and Cactus Plants Flower Pot Home Desk Garden Decor Size 10*10 cm',
          status: 'ยกเลิกการขาย',
          price: 39,
          discount: 0.49,
          total: 88,
          imgsURL: [
            'https://my-test-11.slatic.net/p/a74698f95c3a84189cbc13d9f54e6791.jpg',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 7,
          title: 'New โปร ลดสุด 70% กุหลาบหินนำเข้าราคาพิเศษ กระถาง 2 นิ้ว G Succulents Super sale Set 2',
          type: 'สินค้าสำเร็จรูป',
          size: ['M'],
          detail: 'New โปร ลดสุด 70% กุหลาบหินนำเข้าราคาพิเศษ กระถาง 2 นิ้ว G Succulents Super sale Set 2',
          price: 165,
          discount: 0.76,
          total: 89,
          imgsURL: [
            'https://th-test-11.slatic.net/p/9d6588fe9124e5155fab43e2972b0021.jpg',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 8,
          title: 'Echeveria Jung In กระถาง 2 นิ้ว Gsucculents',
          type: 'สินค้าสำเร็จรูป',
          size: ['S'],
          detail: 'Echeveria Jung In กระถาง 2 นิ้ว Gsucculents',
          price: 169,
          discount: 0.76,
          total: 12,
          imgsURL: [
            'https://th-test-11.slatic.net/p/7b14de23d461cfcf9896eb7468355f99.jpg',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 9,
          title: 'G Succulents กระถางดินเผาทำมือ Clay Series BC005',
          type: 'กระถาง',
          size: ['S', 'M', 'L'],
          detail: 'G Succulents กระถางดินเผาทำมือ Clay Series BC005',
          price: 160,
          discount: 0.44,
          total: 2,
          imgsURL: [
            'https://cf.shopee.co.id/file/96277963411c8fd1fb60fc6932e10cac',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
        ProductItem(new ProductModel(
          id: 10,
          title: 'กระถางต้นไม้สีธรรมชาติ 3 ขนาด Succulent and Cactus Plants Flower Natural Pot Home Desk Garden Decor 3 Sizes',
          type: 'กระถาง',
          size: ['M', 'L'],
          detail: 'กระถางต้นไม้สีธรรมชาติ 3 ขนาด Succulent and Cactus Plants Flower Natural Pot Home Desk Garden Decor 3 Sizes',
          price: 29,
          discount: 0.21,
          total: 8,
          imgsURL: [
            'https://laz-img-sg.alicdn.com/p/6354748d295692179a650ca7cbb45524.jpg_720x720q80.jpg_.webp',
            'https://www.homefurnishingdeals.com/wp-content/uploads/2017/01/Wish-you-have-a-nice-day-45-Round-Plastic-Plant-Flower-Pots-Home-Office-Decor-Planter-5-Colors-5-4inch-0.jpg',
            'https://th-test-11.slatic.net/p/6ab545b542621c08d8b5e1c33dc27bba.jpg_720x720q80.jpg_.webp"',
            'https://my-test-11.slatic.net/p/58bf63775c46d05dd36b117f552191dc.jpg_720x720q80.jpg_.webp',
          ]
        )),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Mini Plant'),
        automaticallyImplyLeading: false,
        actions: <Widget> [
        ],
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget> [
            this.productBar.build(context: context),
          ],
        ),
      )
    );
  }
}
