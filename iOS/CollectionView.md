# CollectionView

API를 사용할 때 데이터를 어떻게 얻을 것인지가 가장 중요하다

테이블 뷰에서는 변수로 데이터를 설정할 수 없으므 테이블 뷰가 데이터를 요청해야한다. 데이터 요청은 델리게이션 방식으로 요청 할 수 있다.

dataSource라는 프로토콜에는 데이터를 요청하는 한 뭉치의 메소드가 있다.

데이터를 어떻게 보여줄지 설정

1. func numberOfSections(in collectionView: UICollectionView) -> Int

   : 섹션의 개수 설정

2. Func collectionView(_ cv: UICV, numberOfItemsInSection section: Int) -> Int

   : 한 섹션에 몇개의 아이템이 있는지 설정

3. Func collectionView(_ cv: UICV, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { : 각 아이템에 데이터를 받아와서 UI 뷰를 리턴

   let cell = tv.dequeueReusableCell(withIdentifier: "MyCellId", for: indexPath) }

   - dequeueReusableCell

     - Cell Reuse : 만약 만 개의 정보가 있는 뷰가 있고 만 개의 UI 뷰를 갖는 것은 매우 비효율적이다. 따라서 실제 보여지는 뷰의 셀만 생하고 스크롤하여 어떤 셀이 맨 위로 가게 되면 이는 재사용되서 맨 아래에 놓여지게 된다.  따라서 스크롤 하는 동안 반복적으로 뷰는 재사용된다.

       만약 어떤 정보가 맨 위로 가서 더 이상 뷰에 보여지지 않으 이 정보를 보여주던 셀은 즉 UI 뷰인 UICollectionView는 재사용 풀로 가서 dequeueReusableCell를 통해 셀을 가져온다.

     - Cell Creation : **셀의 동작 방식?**

       만약 재사용 할 수 있는 셀이 없다면 화면이 막 띄어진 상태라면 아무것도 없으므로 스토리보드에서 만든 프로토타입을 복사해서 사용한다. 레이블, 버튼, 이미지 등을 사용해 셀의 모양을 만들고 오토레이아웃 등을 사용해 스토리보드에 바로 셀을 고정시키면 셀이 필요할 때마다 스토리보드에서 복사본을 만들고 이를 재사용하게 된다.

       

       **셀이 재사용 된다는 사실**은 멀티스레딩에 큰 영향을 준다. 셀에 이미지가 있고 이를 가져와야 하기 때문, 다른 스레드에서 데이터를 가져오는 작업은 오랜 시간이 걸리고 그 사이 사용자는 스크롤해서 그 셀을 보내고 재사용을 하게 된다. 그럼 앱은 이미 다른  셀을 보여주는데 아까 요청한 이미지가 보여지게 된다. 주의 하지 않으면 다른 셀의 이미지를 새로운 셀에 보여주게 된다. 따라서 이미지가 오면 이것을 요청한 셀이 여전히 화면에 보여지고 있는지 확인해야 한다. (다시 돌아온 데이터에 대해서는 항상 이를 요청한 것이 여전히 있는지 확인해야한다. 셀은 끊임없이 재사용작업을 반복 하기 때문이다. )

   - IndexPath : 섹션과 아이템을 가짐, 현재 머물러 있는 위치(그 위치에 해당하는 셀을 요청했기 때문)

   

