<%--
  Created by IntelliJ IDEA.
  User: Zhaohui.Gao
  Date: 2019/8/7
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../common/link/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="/extra/video-7.5.5/css/video-js.min.css">
    <script src="/extra/video-7.5.5/js/video.min.js"></script>
    <title>LuckinCoffee</title>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
    <div style="margin-top: 50px">
        <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="1280" height="556"
               data-setup="{}">
            <source src="/videos/luckincoffee_TVC30.mp4" type='video/mp4' />
        </video>
    </div>
</body>
<script type="text/javascript">
    var myPlayer = videojs('example_video_1');
    videojs("example_video_1").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });
</script>
</html>
