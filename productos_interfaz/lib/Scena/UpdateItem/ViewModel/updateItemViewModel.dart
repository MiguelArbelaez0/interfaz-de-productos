import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:productos_interfaz/Data/item_data.dart';
import 'package:productos_interfaz/Repository/update_item.dart';

import '../../../Data/currency_data.dart';
import '../../../Repository/ListRepository.dart';

abstract class IUpdateViewModel {
  void onUpdateComplete(ItemData itemData);
  void onCompleteGetListCurrency(ListCurrency listCurrency);
  void onError(String error);
  void onCompleteLoadImage(XFile fileName);
}

class IupdateViewModel implements IUUpdateItemrepository, IListRepository {
  late IUpdateRepository iUpdateRepository;
  late IUpdateViewModel iUpdateViewModel;
  late ListRepository listRespository;
  IupdateViewModel(this.iUpdateViewModel) {
    iUpdateRepository = IUpdateRepository(this);
    listRespository = ListRepository(this);
  }
  void upDateItem(
    File imageFile,
    ItemData itemData,
  ) {
    iUpdateRepository.updateItem(
      imageFile,
      itemData,
    );
  }

  void getListText() {
    listRespository.getListCurrency();
  }

  void getImageFile(String urlImage) {
    iUpdateRepository.getImageFile(urlImage);
  }
  @override
  void onError(String error) {
    // TODO: implement onError
    iUpdateViewModel.onError(error);
  }

  @override
  void onUpdateItem(ItemData itemData) {
    // TODO: implement onUpdateItem
    iUpdateViewModel.onUpdateComplete(itemData);
  }

  @override
  void onCompleteGetListCurrency(ListCurrency listCurrency) {
    // TODO: implement onCompleteGetListCurrency
    iUpdateViewModel.onCompleteGetListCurrency(listCurrency);
  }

  @override
  void onShowError(String error) {
    // TODO: implement onShowError
  }

  @override
  void onCompleteLoadImage(XFile fileName) {
    iUpdateViewModel.onCompleteLoadImage(fileName);
  }
}
