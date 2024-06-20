// Set value from quantity modal to cart modal
$(".portfolio-links").on("click", function () {
  id = $(this).closest("form").find("#id").val();
  nama = $(this).closest("form").find("#nama").val();
  harga = $(this).closest("form").find("#harga").val();
  deskripsi = $(this).closest("form").find("#deskripsi").val();
  discount = $(this).closest("form").find("#disc").val();
  hdiscount = $(this).closest("form").find("#hdisc").val();

  $("#deskripsiQ").html(deskripsi);
  document.getElementById("idQ").value = id;
  document.getElementById("namaQ").value = nama;
  document.getElementById("hargaQ").value = hdiscount;
  $("#exampleModalLabel").html(
    nama + " : " + harga + " disc " + discount + "%" + " = " + hdiscount
  );
});
