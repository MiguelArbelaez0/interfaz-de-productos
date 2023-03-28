import 'dart:io';

import '../../../Data/currency_data.dart';
import '../../../Data/item_data.dart';
import '../../../Repository/ListRepository.dart';
import '../../../Repository/itemRepository.dart';

abstract class IItemViewModel {
  void onCompleteGetListCurrency(ListCurrency listCurrency);
  void onCreateItem(ItemData itemData);
  void onError(String error);
}

class ItemViewModel implements IUitemRepository, IListRepository {
  late ITemRepository itemRepository;
  late IItemViewModel iitemViewModel;
  late ListRepository listRespository;
  ItemViewModel(this.iitemViewModel) {
    itemRepository = ITemRepository(this);
    listRespository = ListRepository(this);
  }

  void createItem(
    File imageFile,
    ItemData itemData,
  ) {
    itemRepository.createItem(
      imageFile,
      itemData,
    );
  }

  void getListText() {
    listRespository.getListCurrency();
  }

  @override
  void onError(String error) {
    iitemViewModel.onError(error);
  }

  @override
  void onCreateItem(ItemData itemData) {
    iitemViewModel.onCreateItem(itemData);
  }

  @override
  void onCompleteGetListCurrency(ListCurrency listCurrency) {
    iitemViewModel.onCompleteGetListCurrency(listCurrency);
  }

  @override
  void onShowError(String error) {
    // TODO: implement onShowError
  }
}
