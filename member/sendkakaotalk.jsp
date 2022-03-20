<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>ī�� ����</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
    <input type="button" onClick="sendLinkCustom();" value="Custom"/>
    <input type="button" onClick="sendLinkDefault();" value="Default"/>

<script type="text/javascript">
    function sendLinkCustom() {
        Kakao.init("11400a9267d93835389eb9255fcaad0b");
        Kakao.Link.sendCustom({
            templateId: 70745
        });
    }
</script>

<script>
try {
  function sendLinkDefault() {
    Kakao.init('11400a9267d93835389eb9255fcaad0b')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '���� ġ�� ����',
        description: '#���� #���� #���� #ī�� #������ #�Ұ���',
        imageUrl:
          'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845,
      },
      buttons: [
        {
          title: '������ ����',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '������ ����',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
    })
  }
; window.kakaoDemoCallback && window.kakaoDemoCallback() }
catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
</script>
   
</body>
</html>