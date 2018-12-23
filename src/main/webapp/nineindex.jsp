<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<title>H5九宫格抽奖</title>
		<link href="css/activity-style.css" rel="stylesheet" type="text/css">
	</head>

	<body class="activity-lottery-winning">
		<div class="main">
			<marquee direction="right"><h2>当前登陆者为${employee.employeeName} 中奖者为:<span id="winner"> JOKE  </span></h2></marquee>
			<div style="text-align: center;margin: 100px 0 0 0">
				<canvas id="canvas" width="320px" height="320px" style="width: 320px;height: 320px;"></canvas>
			</div>
			<div class="content">
				<div class="boxcontent boxyellow">
					<div class="box">
						<div class="title-green"><span>奖项设置：</span>
						</div>
						<div class="Detail">
							<p>一等奖：网时奖励200小时 。奖品数量：3 </p>
							<p>二等奖：网时奖励100小时 。奖品数量：5 </p>
							<p>三等奖：广播台免费点首歌 。奖品数量：10 </p>
						</div>
					</div>
				</div>
				<div class="boxcontent boxyellow">
					<div class="box">
						<div class="title-green">活动说明：</div>
						<div class="Detail">
							<p>本次活动每人可以转 3 次 </p>
							<p>我们的中奖率高达33.3%！！ </p>
						</div>
					</div>
				</div>
			</div>

		</div>
		<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="js/jQueryRotate.2.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/ES6/Global.js"></script>
		<script src="js/ES6/Sudoku.js"></script>
		<script type="text/javascript">
            var canvas = document.getElementById('canvas'),
                context = canvas.getContext('2d');
            var ratio = window.devicePixelRatio || 1;
            new Sudoku({
                sudokuSize: canvas.width,
                jumpIndex: Math.floor(Math.random() * 7),
                awards: [
                    {type: 'text', content: '30元话费'},
                    {type: 'text', content: 'iphoneX'},
                    {type: 'losing', content: '未中奖'},
                    {type: 'text', content: 'MackBook Pro'},
                    {type: 'image', content: 'https://img12.360buyimg.com/n7/jfs/t4807/209/1436278963/496606/8e486549/58f0884eNcec87657.jpg'},
                    {type: 'losing', content: '海南3日游'},
                    {type: 'image', content: 'https://img11.360buyimg.com/n7/jfs/t3187/325/423764794/213696/f4eb1dbd/57b68142Nbe104228.jpg'},
                    {type: 'text', content: '火星一日游'}
                ],

                finish: function (index) {
                    switch(this.awards[index].type) {
                        case 'text':
                            alert('🎉恭喜您中得：' + this.awards[index].content);
                            break;
                        case 'image':
                            if (index === 4)      alert('🎉恭喜您中得战争磨坊水冷机');
                            else if (index === 6) alert('🎉恭喜您中得魔声耳机');
                            break;
                        case 'losing':
                            alert('💔很遗憾，您没有中奖~');
                            break;
                    }

                    $.ajax({
                        url:'${ctx}/LotteryServlet',
                        type:'POST',
                        async:true,    //或false,是否异步
                        data:{index: index,userid :${employee.employeeId}},
                        timeout:5000,    //超时时间
                        dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                        success:function(data){
                           //这个无所谓成功失败
                        },
                        error:function(xhr,textStatus){
                            alert('💔很遗憾，奖品已经发完了~');
                        }
                    })
                }


            }).render(canvas, context, ratio);



		</script>

	</body>

</html>