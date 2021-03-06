{application,esip,
             [{description,"ProcessOne SIP server component in Erlang"},
              {vsn,"1.0.4"},
              {modules,[esip,esip_app,esip_client_transaction,esip_codec,
                        esip_dialog,esip_listener,esip_server_transaction,
                        esip_socket,esip_sup,esip_tmp_sup,esip_transaction,
                        esip_transport,esip_udp_sup]},
              {registered,[]},
              {applications,[kernel,stdlib]},
              {env,[]},
              {mod,{esip_app,[]}},
              {files,["src/","include/","c_src/esip_codec.c","rebar.config",
                      "rebar.config.script","README.md","LICENSE.txt"]},
              {licenses,["Apache 2.0"]},
              {maintainers,["ProcessOne"]},
              {links,[{"Github","https://github.com/processone/esip"}]}]}.
