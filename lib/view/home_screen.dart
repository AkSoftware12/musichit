import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_with_provider/model/services/api_response.dart';
import 'package:mvvm_with_provider/utils/app_colors.dart';
import 'package:mvvm_with_provider/view_model/user_list_provider.dart';
import 'package:provider/provider.dart';
import '../app_store/app_store.dart';
import '../routes/name_routes.dart';
import '../textSize.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserListProvider userListProvider = UserListProvider();

  @override
  void initState() {
    userListProvider.fetchUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Set your design size here
      minTextAdapt: true, // Ensure this is initialized
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        // backgroundColor: primaryColor,
        backgroundColor: Colors.black,
        title: Text("Home Screen", style: TextStyle(color: whiteColor)),
        actions: [
          IconButton(
              onPressed: () {
                AppStore().removeToken();
                Navigator.pushReplacementNamed(context, RouteName.logInScreen,
                    arguments: {'title': 'LogIn'});
              },
              icon: Icon(
                Icons.logout,
                color: whiteColor,
              ))
        ],
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => userListProvider,
        child: Consumer<UserListProvider?>(builder: (context, value, _) {
          switch (value?.userList.status) {
            case Status.loading:
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            case Status.error:
              return Center(
                child: Text(value!.userList.message.toString()),
              );

            case Status.complete:
              return SingleChildScrollView(
                child: Column(
                  children: (value?.userList.data?.category ?? []).map((category) {
                    return SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 40.sp,
                              child: ListView.builder(
                                  itemCount: 1,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        category.name.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: TextSizes.textmedium,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) {
                                          //       return CatergoryViewAllClass(
                                          //         name: category['name'],
                                          //         id: category['id'].toString(),
                                          //       );
                                          //     },
                                          //   ),
                                          // );
                                        },
                                        child: Text(
                                          'View All',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: TextSizes.textmedium,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: TextSizes.SizeBoxMain,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                    height: TextSizes.SizeBoxSub,
                                    child: ListView.builder(
                                        itemCount: category.playlist?.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, itemIndex) {
                                          final playlist =
                                              category.playlist;
                                          return GestureDetector(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) {
                                                //       return SongsDeatilsList(
                                                //         url: category['playlist']
                                                //                 [itemIndex]['id']
                                                //             .toString(),
                                                //         image:
                                                //             category['playlist'][
                                                //                         itemIndex]
                                                //                     ['image_data']
                                                //                 .toString(),
                                                //         title: category['playlist']
                                                //                     [itemIndex]
                                                //                 ['playlist_name']
                                                //             .toString(),
                                                //         type: 'playlist_id',
                                                //       );
                                                //     },
                                                //   ),
                                                // );
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(0.0),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: TextSizes
                                                              .imageheight,
                                                          width: TextSizes
                                                              .imagewidth,
                                                          child: Card(
                                                            color: Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: playlist![itemIndex].imageData
                                                                    .toString(),
                                                                fit: BoxFit.fill,
                                                                // Adjust this according to your requirement
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: Colors
                                                                        .orangeAccent,
                                                                  ),
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  'assets/no_image.jpg',
                                                                  // Path to your default image asset
                                                                  // Adjust width as per your requirement
                                                                  fit: BoxFit
                                                                      .cover, // Adjust this according to your requirement
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 100.sp,
                                                    child: Center(
                                                      child: Text(
                                                        playlist[itemIndex].playlistName
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: TextSizes
                                                                  .textsmallPlayer,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Text(
                                                  //       newReleas[
                                                  //       index]['subtitle'].toString(),
                                                  //       style:
                                                  //       GoogleFonts.poppins(
                                                  //         textStyle:
                                                  //         const TextStyle(
                                                  //             color:
                                                  //             Colors.grey,
                                                  //             fontSize: 11,
                                                  //             fontWeight:
                                                  //             FontWeight
                                                  //                 .normal),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                ],
                                              ));
                                        }),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );

            // ListView.builder(
            // itemCount: value?.userList.data!.songs!.length,
            //   itemBuilder: (context, index){
            //   final data = value?.userList.data!.songs![index];
            //   return Card(
            //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         backgroundImage: NetworkImage(data!.imageData.toString()),
            //       ),
            //       title: Text(data.title.toString()),
            //       subtitle: Text(data.subtitle.toString()),
            //     ),
            //   );
            //   });

            default:
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
