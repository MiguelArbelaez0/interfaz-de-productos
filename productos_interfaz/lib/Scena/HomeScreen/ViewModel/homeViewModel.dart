import '../../../Data/GetListItems.dart';
import '../../../Repository/GetListRepository.dart';

abstract class IIGetListViewModel {
  void onGetItem(GetListItems getListItems);
  void onError(String error);
}

class IGetViewModel implements IUGetListrepository {
  late IGetListRepository iGetListRepository;
  late IIGetListViewModel iiGetListViewModel;
  IGetViewModel(this.iiGetListViewModel) {
    iGetListRepository = IGetListRepository(this);
  }

  void getListItem() {
    iGetListRepository.getlistItem();
  }

  @override
  void onError(String error) {
    // TODO: implement onError
    iiGetListViewModel.onError(error);
  }

  @override
  void onGetItem(GetListItems getListItems) {
    // TODO: implement onGetItem}
    iiGetListViewModel.onGetItem(getListItems);
  }
}
