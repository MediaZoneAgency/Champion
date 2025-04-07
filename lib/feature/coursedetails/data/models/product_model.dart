class ProductModel {
  int? id;
  String? title;
  String? content;
  String? salePrice; // Change to String
  String? thumbnailUrl;
  String? link;

  ProductModel({
    this.id,
    this.title,
    this.content,
    this.salePrice,
    this.thumbnailUrl,
    this.link,
  });

factory ProductModel.fromMap(Map<String, dynamic> map) {
  // دالة مساعدة للتحقق من نوع الرابط وتحويله بأمان
  String? parseThumbnailUrl(dynamic url) {
    if (url is String && url.isNotEmpty) { // تحقق هل هو نص وغير فارغ؟
      return url;
    }
    return null; // إذا كان false أو null أو أي نوع آخر، أرجع null
  }

  return ProductModel(
    id: map['ID'],
    title: map['title'],
    content: map['content'],
    salePrice: _parseSalePrice(map['sale_price']),
    thumbnailUrl: parseThumbnailUrl(map['thumbnail_url']), // استخدم الدالة الآمنة هنا
    link: map['link'],
    // يمكنك إضافة الحقول الأخرى مثل ratings و enrolled_students إذا احتجت إليها
  );
}

// دالة parseSalePrice تبقى كما هي أو تحسنها للتعامل مع النص الفارغ أيضاً
static String? _parseSalePrice(dynamic salePrice) {
  if (salePrice == null) return null;
  // تعامل مع النص الفارغ إذا كان السعر يمكن أن يكون ""
  if (salePrice is String && salePrice.isEmpty) return null;
  if (salePrice is String) return salePrice;
  if (salePrice is num) return salePrice.toString();
  return null;
}


  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'title': title,
      'content': content,
      'sale_price': salePrice,
      'thumbnail_url': thumbnailUrl,
      'link': link,
    };
  }
}