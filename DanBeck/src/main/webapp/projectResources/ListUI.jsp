<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style>
    .carousel-inner img {
      margin: 0rem 3rem;
    }

    .row>div {
      border: 1px solid black;
    }

    .col-1>.btn {
      margin: 0px 3px;
      padding: 3px;
      width: 100px;
    }

    #main-menu>.nav-item>.nav-link.active {
      background-color: #5cb85c;
      color: #fff;
      /* ���õ� ��ũ �ؽ�Ʈ ���� */
    }

    #main-menu>.nav-item>.nav-link {
      color: #5cb85c;
    }
  </style>

</head>
<body>

<jsp:include page="Header.jsp" flush="false"/>
    <div class="container-fluid">
      <div class="row gx-0">
        <div class="col-md-10">





          <div class="container">
            <div class="row">
              <div class="col">
                <div id="carouselExampleControls" class="carousel slide" style="background-color: lightblue;">
                  <div class="carousel-inner">
                    <div class="carousel-item text-center active">
                      <a href="#"><img class="img-fluid" src="img/���.png" style="width: 10rem; height: 10rem;"></a>
                      <a href="#"><img class="img-fluid" src="img/���.png" style=" width: 10rem; height: 10rem;"></a>
                      <a href="#"><img class="img-fluid" src="img/����.png" style="width: 10rem; height: 10rem;"></a>
                    </div>
                    <div class="carousel-item text-center">
                      <a href="#"><img class="img-fluid" src="img/��ä.png" style="width: 10rem; height: 10rem;"></a>
                      <a href="#"><img class="img-fluid" src="img/������.png" style="width: 10rem; height: 10rem;"></a>
                      <a href="#"><img class="img-fluid" src="img/ġŲ.png" style="width: 10rem; height: 10rem;"></a>
                    </div>
                    <div class="carousel-item text-center">
                      <a href="#"><img class="img-fluid" src="img/�佺ƮǪ��.png" style="width: 10rem; height: 10rem;"></a>
                      <a href="#"><img class="img-fluid" src="img/�ع�.png" style="width: 10rem; height: 10rem;"></a>
                    </div>
                  </div>

                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                    <img class="img-fluid" src="img/����ȭ��ǥ.png">
                    <span class="visually-hidden">Previous</span>
                  </button>

                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                    <img class="img-fluid" src="img/������ȭ��ǥ.png">
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
            </div>



            <div class="row">
              <div class="col-1 d-flex align-items-center">
                <button class="btn btn-success btn-block">�ڹٽ�ũ��Ʈ </button>
              </div>
              <div class="col-1 d-flex align-items-center">
                <button class="btn btn-success btn-block">JSP </button>
              </div>
              <div class="col-1 d-flex align-items-center">
                <button class="btn btn-success btn-block">�Ǵ� </button>
              </div>
              <div class="col-1 d-flex align-items-center">
                <button class="btn btn-success btn-block">�ڹٽ�ũ��Ʈ </button>
              </div>
              <div class="col-1">
                <button class="btn btn-success btn-block">������ �޾Ƽ��߰����� </button>
              </div>
              <div class="col-1">
                <button class="btn btn-success btn-block">������ �޾Ƽ��߰����� </button>
              </div>
              <div class="col-1">
                <button class="btn btn-success btn-block">������ �޾Ƽ��߰����� </button>
              </div>
              <div class="col-1">
                <button class="btn btn-success btn-block">������ �޾Ƽ��߰����� </button>
              </div>
              <div class="col-1">
                <button class="btn btn-success btn-block">������ �޾Ƽ��߰����� </button>
              </div>
              <div class="col-1">
                <button class="btn btn-success btn-block">������ �޾Ƽ��߰����� </button>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <div class="container">
                  <div class="row">
                    <div class="col-1">
                      < </div>
                        <div class="col-10">
                          ��ȸ��
                        </div>
                        <div class="col-1">
                          >
                        </div>
                    </div>
      
                    <div class="row">
                      <div class="col-12">
                        <div>�Խù� 1��</div>
                      </div>
                    </div>
      
                    <div class="row">
                      <div class="col-12">
                        <div>�Խù� 2��</div>
                      </div>
                    </div>
      
      
                    <div class="row">
                      <div class="col-12">
                        <div>�Խù� 3��</div>
                      </div>
                    </div>
      
                  </div>
                </div>
                

              </div>
            </div>
          </div>
      




        <div class="col-md-2">
          <h1>���� ������</h1>
          <div class="container">
            <div class="row">
              <div class="col-1">
                < </div>
                  <div class="col-10">
                    ��ȸ��
                  </div>
                  <div class="col-1">
                    >
                  </div>
              </div>

              <div class="row">
                <div class="col-12">
                  <div>�Խù� 1��</div>
                </div>
              </div>

              <div class="row">
                <div class="col-12">
                  <div>�Խù� 2��</div>
                </div>
              </div>


              <div class="row">
                <div class="col-12">
                  <div>�Խù� 3��</div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
  </body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</html>