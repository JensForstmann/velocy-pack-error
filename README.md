# VPE

mix deps.get

mix deps.compile

mix run -e "VPE.run"

Output:

```
[info]  {:error,
 %Arangox.Error{
   endpoint: "http://127.0.0.1:8529",
   error_num: 4,
   message: "VPack error: Array structure is invalid (exception location: D:\\hw15-windows\\oskar\\work\\ArangoDB\\arangod\\GeneralServer\\RestHandler.cpp:514). Please report this error to arangodb.com",
   status: 500
 }}
```

Changing the body only slightly (e.g reducing the length of a string) will result in a successful operation:

```
[info]  {:ok,
 %Arangox.Response{
   body: %{"code" => 200, "error" => false, "result" => true},
   headers: %{},
   status: 200
 }}
```
