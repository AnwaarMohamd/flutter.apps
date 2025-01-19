import 'package:flutter/material.dart';
import 'package:meilisync_app/model/meilimodel.dart';
import 'package:meilisync_app/network/meiliapi.dart';

class Meillipage extends StatefulWidget {
  const Meillipage({super.key});

  @override
  State<Meillipage> createState() => _MeillipageState();
}

class _MeillipageState extends State<Meillipage> {
  String label = '';
  String url = '';
  String apiKey = '';
  String id = '';
  final GlobalKey<ScaffoldState> addmilly = GlobalKey<ScaffoldState>();
  late Future<List<Item>> meile;
  List<Item> items = []; // القائمة لتخزين البيانات المحملة
  int currentPage = 1; // الصفحة الحالية
  bool isLoading = false; // للتحقق من إذا كان هناك تحميل بيانات

  final ScrollController _scrollController = ScrollController();
  final int limit = 10; // عدد العناصر في الصفحة

  @override
  void initState() {
    super.initState();
    fetchdata(); // تحميل البيانات الأولى
    _scrollController.addListener(_scrollListener); // مراقبة التمرير
  }

  @override
  void dispose() {
    _scrollController.dispose(); // التخلص من الـ ScrollController
    super.dispose();
  }

  void fetchdata() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      List<Item> newItems =
          await API.getMilly(currentPage, limit); // استدعاء API مع الصفحة والحد
      setState(() {
        items.addAll(newItems); // إضافة البيانات الجديدة للقائمة
        currentPage++; // الترقية للصفحة التالية
        isLoading = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchdata(); // تحميل المزيد عند الوصول لنهاية القائمة
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0, // التمرير لأعلى الصفحة
      duration:
          const Duration(milliseconds: 500), // المدة الزمنية للتمرير السلس
      curve: Curves.easeInOut, // شكل الحركة
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showForm(BuildContext context) {
    label = '';
    url = '';
    apiKey = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter data'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Label'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    label = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Url'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    url = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Api Key'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    apiKey = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  API
                      .createMilly(Item(
                    id: id,
                    label: label,
                    url: url,
                    apiKey: apiKey,
                  ))
                      .then((search) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('تم إنشاء المؤلف مع المعرف')),
                    );
                  });
                  fetchdata();
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _showEditForm(BuildContext context, Item item) {
    label = item.label;
    url = item.url;
    apiKey = item.apiKey;
    id = item.id; // Store the id for later use

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit data'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Label'),
                  initialValue: label, // Pre-fill with current value
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    label = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Url'),
                  initialValue: url, // Pre-fill with current value
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    url = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Api Key'),
                  initialValue: apiKey, // Pre-fill with current value
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter value';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    apiKey = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  API
                      .editMilly(Item(
                    id: id, // Use the id for update
                    label: label,
                    url: url,
                    apiKey: apiKey,
                  ))
                      .then((search) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('تم تعديل المؤلف مع المعرف')),
                    );
                  });
                  fetchdata();
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MeiliPage",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[600],
      ),
      body: items.isEmpty && !isLoading
          ? const Center(child: Text('لا توجد بيانات'))
          : ListView.builder(
              controller: _scrollController, // إضافة الـ ScrollController
              itemCount: items.length + 1, // لعرض مؤشر التحميل في نهاية القائمة
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return isLoading
                      ? const Center(
                          child: CircularProgressIndicator()) // مؤشر التحميل
                      : const SizedBox
                          .shrink(); // عدم عرض شيء عند الانتهاء من التحميل
                } else {
                  final item = items[index];
                  return Dismissible(
                    key: ObjectKey(item.id),
                    background: Container(
                      color: Colors.red[700],
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm delete'),
                            content: const Text('Are you sure?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) {
                      API.deleteMilly(item.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('deleted done >> ${item.label}')),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        _showEditForm(context, item);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(item.label),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.url),
                              Text(item.apiKey),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _scrollToTop, // استدعاء الدالة للعودة إلى أعلى الصفحة
            tooltip: 'الذهاب إلى أعلى الصفحة',
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              _showForm(context); // استدعاء نموذج الإضافة
            },
          ),
        ],
      ),
    );
  }
}
