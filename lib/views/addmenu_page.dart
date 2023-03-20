import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegytably_merchant/views/home_page.dart';
import 'package:vegytably_merchant/widgets/input_text.dart';
import 'package:dotted_border/dotted_border.dart';
import '../controllers/menu_controller.dart';
import '../widgets/menu_checkbox.dart';

class AddMenuPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final MerchantMenuController menuController =
      Get.put(MerchantMenuController());
  final bool isChecked = false;

  AddMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            // delete uploaded image if user cancel
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, top: 10),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            "Add Menu",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 50,
        leadingWidth: 30,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.only(top: 11, left: 40, right: 40),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Detail Menu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 171, 174, 171)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(0xff70CB88),
                            width: 1,
                          ),
                        ),
                        child: CheckboxListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Menu Ready Stock',
                                style: TextStyle(
                                  color: Color(0xff2f0808),
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Check the box whenever you’re ready to serve this menu!',
                                style: TextStyle(
                                  color: Color(0xff9f9f9f),
                                  fontSize: 12,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: isChecked,
                          onChanged: (bool? value) {
                            // isChecked = !isChecked;
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "TITLE",
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 10,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    // width: 300,
                    child: InputTextField(
                      textEditingController: nameController,
                      hintText: 'Cth: Ayam goyang + Nasi',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "DESKRIPSI",
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 10,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    child: TextField(
                      //hint text color
                      maxLines: 3,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        //outline color
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xfff6f7fb), width: 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: const Color(0xfff6f7fb),
                        hintText:
                            "Cth: Ayam digoyang-goyangin dengan oreo vanila",
                        hintStyle: const TextStyle(
                          color: Color(0xff9f9f9f),
                          fontFamily: 'Rubik',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xfff6f7fb), width: 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "PRICE",
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 10,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  InputTextField(
                    textInputType: TextInputType.number,
                    textEditingController: priceController,
                    hintText: 'Cth: 21.999',
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "MENU PICTURE",
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 10,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width - 40 * 2,
                    child: DottedBorder(
                      dashPattern: [8, 8],
                      radius: const Radius.circular(8),
                      child: Container(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                // Profile Image preview
                                const Icon(
                                  Icons.image_outlined,
                                  size: 150,
                                ),
                                const SizedBox(height: 19),
                                const Text(
                                  "Upload Image From Your Device",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 19),
                                // Camera Button
                                Container(
                                  width: MediaQuery.of(context).size.width -
                                      40 * 2 -
                                      23 * 2,
                                  height: 36,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffefefef),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Spacer(),
                                        Container(
                                            width: 20,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              size: 20,
                                            )),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "Camera",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Container(
                                    width: MediaQuery.of(context).size.width -
                                        40 * 2 -
                                        23 * 2,
                                    height: 36,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffefefef),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Spacer(),
                                          Container(
                                              width: 22,
                                              height: 15,
                                              child: const Icon(
                                                Icons.photo_library,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                size: 20,
                                              )),
                                          const SizedBox(width: 10),
                                          const Text(
                                            "Gallery",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    )),
                                const SizedBox(height: 24),
                              ])),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "FOOD REQUIREMENT",
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 10,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        MenuCheckbox('Dairy-Free (no milk products)'),
                        const SizedBox(height: 10),
                        MenuCheckbox('Meat-Free'),
                        const SizedBox(height: 10),
                        MenuCheckbox('Fish-Free'),
                        const SizedBox(height: 10),
                        MenuCheckbox('Glutten-Free'),
                        const SizedBox(height: 10),
                        MenuCheckbox('Egg-Free'),
                        const SizedBox(height: 10),
                        MenuCheckbox('Nut-Free'),
                      ],
                    ),
                  ),
                ],
              ),
              // Input Email or Telephone Number
              const SizedBox(height: 20),

              const SizedBox(height: 40),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Get.offAll(() => const HomePage(),
                  //     transition: Transition.fade);
                  // Add Menu
                  menuController.addMenu(
                    nameController,
                    descriptionController,
                    priceController,
                  );
                },
                child: const Text(
                  'Add Menu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ]),
        )
      ]),
      // bottomNavigationBar: Container(
      //       height: 87.7,
      //       decoration: BoxDecoration(

      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

      //           boxShadow: [
      //           BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),
      //           ],

      //       ),

      //       child: ClipRRect(

      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(25.50), topRight: Radius.circular(25.50), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

      //           child: CustomBottomNavigationBar(initialIndex: 3),
      //       )
      // )
    );
  }
}
