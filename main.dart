// https://dartpad.dev/?id=116ff2203e4c3a7d87587469189dda09
// 위의 것을 바탕으로 만들었습니다.
// Udemy 코딩 페스티벌 2023
// 💻 [실습 프로젝트 03] 프로필 포트폴리오 앱 제작 / 홍드로이드 (12/7)

import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ProfilePortfolioApp());

class ProfilePortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 초기값
  String email = 'wkgek@naver.com'; // 이메일
  String residence = '경기도 화성시 병점동'; // 거주지
  int age = 1991; // 출생년도
  
  // 컨트롤러들
  TextEditingController _emailController = TextEditingController();
  TextEditingController _residenceController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  String profileImageUrl = 'https://ye0ngjin.github.io/blog/assets/img/profile.gif'; // 프로필 이미지 url

  final imageUrlController = TextEditingController(); // 이미지 url 입력 컨트롤러
  
  @override
  void initState() {
    super.initState();
    _emailController.text = email;
    _residenceController.text = residence;
    _ageController.text = age.toString();
    imageUrlController.text = profileImageUrl;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _residenceController.dispose();
    _ageController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }
  
  String github = 'https://github.com/Ye0ngjin'; // 깃허브 주소
  // String username = github.split('/').last;
  // 위에서 정의한 github 변수를 '/'로 나누고, 마지막 요소를 가져옴
  
  List<String> lstSkills = [
    'C++',
    'Java',
    '스프링부트',
    'Python',
    '백엔드',
  ];
  List<String> lstCareers = ['웹개발과정 수료,23년 3월 ~ 10월',
                             '게임개발과정 수료,22년 4월 ~ 10월'];
  List<String> lstSites = ['깃허브,https://github.com/Ye0ngjin',
                           '블로그,https://Ye0ngjin.github.io/blog',
                           '1차프로젝트,http://hideon.online'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '최고가 되기보단 최선을 다하는 개발자가 되겠습니다',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0),
                    
                    
                    Center(
                      child: Column(
                        children: [
                          _buildProfileImage(),
                          SizedBox(height: 8.0),
                          
                          Text(
                            github.split('/').last,
                            style: TextStyle(color: Colors.white),
                          )
                          
                        ],
                      ),
                    ),
                    
                    
//                     Center(
//                       child: Column(
//                         children: [
//                           _buildProfileImage(),
//                           SizedBox(height: 8.0),
//                           InkWell(
//                             onTap: () {
//                               // launch(github);
//                             },
//                             child: Text(
//                               github.split('/').last,
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
                    
                    
                    SizedBox(height: 30.0),
                    _buildTextField('이메일 주소', _emailController,
                        onChanged: (value) => email = value),
                    const SizedBox(height: 20),
                    _buildTextField('거주지', _residenceController,
                        onChanged: (value) => residence = value),
                    const SizedBox(height: 20),
                    _buildTextField(
                      '출생년도', _ageController,
                      onChanged: (value) => age = int.tryParse(value) ?? 0,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.0),
                    _buildSkillsSection(),
                    SizedBox(height: 20.0),
                    _buildCareerHistorySection(),
                    SizedBox(height: 20.0),
                    _buildSitesSection(),
                  ],
                ),
              ),
            ),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: _showImageUrlDialog,
      child: CircleAvatar(
        radius: 60.0,
        backgroundImage: NetworkImage(profileImageUrl),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,{
    Function(String)? onChanged,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      keyboardType: keyboardType,
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[200]!],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('주요 기술 및 희망 직무', style: TextStyle(fontSize: 16.0)),
      SizedBox(
        height: 8,
      ),
      Wrap(
          spacing: 8,
          runSpacing: 8,
          children: getSkillItems(),
    ),]
    ,
    )
    ,
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(label: Text(skill));
  }

  Widget _buildCareerHistorySection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[200]!],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('경력 사항', style: TextStyle(fontSize: 16.0)),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: lstCareers.length,
            itemBuilder: (context, index) {
              return getCareerItems(index);
            },
          )
        ],
      ),
    );
  }
  
  Widget _buildSitesSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[200]!],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('사이트', style: TextStyle(fontSize: 16.0)),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: lstSites.length,
            itemBuilder: (context, index) {
              return getSiteItems(index);
            },
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('취업이 완료 되었습니다'),
            ),
          );
        },
        child: Text(
          '좋은 회사 취업 하기',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _showImageUrlDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('프로필 이미지 변경'),
          content: TextField(
            controller: imageUrlController,
            decoration: InputDecoration(labelText: '이미지 URL 입력'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  profileImageUrl = imageUrlController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  List<Widget> getSkillItems() {
    // 주요 기술 및 희망 직무를 android chip 위젯 형태로 리턴
    List<Widget> lstWidgets = [];
    for (String item in lstSkills) {
      lstWidgets.add(_buildSkillChip(item));
    }
    return lstWidgets;
  }

  Widget getCareerItems(int index) {
    // 경력 사항 리스트 타일 위젯 형태로 리턴
    List<String> splitCareer = lstCareers[index].split(',');
    return ListTile(
      title: Text(splitCareer[0]), subtitle: Text(splitCareer[1]),
    );
  }
  
    Widget getSiteItems(int index) {
    // 사이트 링크 리스트 타일 위젯 형태로 리턴
    List<String> splitSite = lstSites[index].split(',');
    return ListTile(
      title: Text(splitSite[0]), subtitle: Text(splitSite[1]),
    );
  }
  
  
}
