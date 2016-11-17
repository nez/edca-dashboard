var Site    = {

    _redirects      : [
        {
            name    : 'regionalizacion',
            url     : 'http://datos.gob.mx/herramientas/regionalizacion-funcional.html'
        },
        {
            name    : 'san-luis-potosi',
            url     : 'http://busca.datos.gob.mx/#/instituciones/ayuntamiento-de-san-luis-potosi'
        },
        {
            name    : 'xalapa',
            url     : 'http://busca.datos.gob.mx/#/instituciones/ayuntamiento-de-xalapa'
        },
        {
            name    : 'datatron',
            url     : 'http://datatron.herokuapp.com/'
        },
        {
            name    : 'catalogo',
            url     : 'http://busca.datos.gob.mx/'
        },
        {
            name    : 'agenda2030',
            url     : 'http://pnud.carto.mx/'
        },
        {
            name    : 'salud',
            url     : 'http://busca.datos.gob.mx/#/conjuntos/recursos-en-salud'
        },
        {
            name    : 'cambioclimatico',
            url     : 'http://cambioclimatico.datos.gob.mx/'
        },
        {
            name    : 'papa-en-mexico',
            url     : 'http://busca.datos.gob.mx/#!/grupos/papaenmex'
        },
        {
            name    : 'inecc',
            url     : 'http://busca.datos.gob.mx/#!/grupos/calidad-del-aire'
        },
        {
            name    : 'INECC',
            url     : 'http://busca.datos.gob.mx/#!/grupos/calidad-del-aire'
        }
    ],

    init            : function () {
        Site._setRedirects();
        Site._loadTweets();
        Site._pageViews();
        Site._setCategories();
        Site._setData();
        Site._setForm();
        Site._setPoll();
        Site._setScrolling();
        Site._setHovers();
        Site._setResources();
        Site._setSidebar();
        Site._setSubscribe();
        Site._setToolData();
        Site._setVideo();
    },

    _alert          : function ( msg, type ) {
        $( '#system-notification' ).css( 'display', 'block' );
        $( '#system-notification .notification' ).addClass( type );
        $( '#system-notification p' ).html( msg );
        $( '#system-notification .notification-container' ).slideDown();

        var timer   = setTimeout( function () {
            $( '#system-notification .notification-container' ).slideUp();
            $( '#system-notification .notification' ).removeClass( type );
            $( '#system-notification p' ).html( '' );
            $( '#system-notification' ).css( 'display', 'none' );
        }, 3500 );

        $( '#system-notification .glyphicon-remove' ).click( function () {
            $( '#system-notification .notification-container' ).slideUp();
            $( '#system-notification .notification' ).removeClass( type );
            $( '#system-notification p' ).html( '' );
            $( '#system-notification' ).css( 'display', 'none' );
            clearTimeout( timer );
        });
    },

    _loadTweets     : function () {
        if ( $( '#tweets' ).length > 0 ) {
            $.get( 'http://dgm-tweets.bitslice.net/tweets.json',
                function ( data ) {
                    var displayed   = 3,
                        total       = data.length,
                        used        = [],
                        randomize   = function ( above, below, used ) {
                            var generated   = Math.floor( Math.random() * below ) + above;

                            if ( used.indexOf( generated ) > -1 ) {
                                return randomize( above, below, used );
                            } else {
                                return generated;
                            }
                        };

                    for ( var i = 0; i < displayed; i++ ) {
                        var index   = randomize( 0, total, used ),
                            tweet   = data[index],
                            date    = moment( tweet.date );
                        used.push( index );

                        var element = $( '<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 tweet"><div class="inner"><p><a href="' + tweet.content_url + '" target="_blank" class="tweet-content">' + tweet.content + '</a></p><p class="small">' + date.format( 'HH:mm A - D MMM YYYY' ) + '</p><div class="author"><div class="pull-left"><p>' + tweet.author + '</p><a href="https://twitter.com/' +tweet.author_handler + '" target="_blank">@' + tweet.author_handler + '</a></div></div></div></div>' );
                        $( '#tweets-container' ).append( element );
                    }
                });
        }
    },

    _pageViews      : function () {
        var path    = window.location.pathname,
            loc     = null;

        path        = path.substring( 1 );

        if ( path.charAt( path.length - 1 ) == '/' ) {
            path    = path.substring( 0, path.length - 1 );
        } else {
            path    = path.replace( '.html', '' );
        }

        if ( path == '' ) {
            loc     = 'datos.landing';
        } else {
            loc     = 'datos.' + path.replace( /\//g, '.' );
        }

        udm_( 'http://b.scorecardresearch.com/b?c1=2&c2=17183199&ns_site=gobmx&name=' + loc );
    },

    _setCategories  : function () {
        var el      = $( '#categories ul li' ),
            width   = el.length * el.width();

        $( '#categories ul' ).width( width );
    },

    _setData        : function () {
        var link    = 'http://busca.datos.gob.mx/';

        if ( $( '#tab-recents' ).length > 0 ) {
            $.get( 'http://catalogo.datos.gob.mx/api/3/action/package_search', {
                    rows    : 4,
                    start   : 0
                }, function ( data ) {
                    var results = data.result.results,
                        list    = $( '#tab-recents tbody' );

                    for ( var i = 0; i < results.length; i++ ) {
                        var organization    = ( results[i].organization ) ? results[i].organization.title : ( results[i].groups && ( results[i].groups.length > 0 ) ) ? results[i].groups[0].display_name : '',
                            el              = $('<tr data-link="' + link + '#!/conjuntos/' + results[i].name + '"><td>' + results[i].title + '</td><td width="20%">' + organization.substring( 0, 20 ) + '</td><td width="20%">' + results[i].metadata_modified.substring( 0, 10 ) + '</td></tr>');

                        list.append( el );
                        el.click( function ( e ) {
                            window.open( $( e.currentTarget ).attr( 'data-link' ), '_blank' );
                        });
                    }
                });
        }

        if ( $( '#tab-downloads' ).length > 0 ) {
            $.get( 'http://catalogo.datos.gob.mx/api/3/action/package_search', {
                    rows    : 4,
                    start   : 0,
                    sort    : 'views_recent desc'
                }, function ( data ) {
                    var results = data.result.results,
                        list    = $( '#tab-downloads tbody' );

                    for ( var i = 0; i < results.length; i++ ) {
                        var organization    = ( results[i].organization ) ? results[i].organization.title : ( results[i].groups && ( results[i].groups.length > 0 ) ) ? results[i].groups[0].display_name : '',
                            el              = $('<tr data-link="' + link + '#!/conjuntos/' + results[i].name + '"><td>' + results[i].title + '</td><td width="20%">' + organization.substring( 0, 20 ) + '</td><td width="20%">' + results[i].metadata_modified.substring( 0, 10 ) + '</td></tr>');
                        list.append( el );
                        el.click( function ( e ) {
                            window.open( $( e.currentTarget ).attr( 'data-link' ), '_blank' );
                        });
                    }
                });
        }

        if ( $( '#data-tab-recents' ).length > 0 ) {
            var section     = $( '#data-tab-recents' ).attr( 'data-tag' );
            $.get( 'http://catalogo.datos.gob.mx/api/3/action/package_search', {
                    q       : 'tags:' + section,
                    rows    : 3,
                    start   : 0
                }, function ( data ) {
                    var results = data.result.results,
                        table   = $( '#data-tab-recents table tbody' );

                    if ( results.length > 0 ) {
                        $( '#category-data' ).removeClass( 'hidden' );
                    }

                    for ( var i = 0; i < results.length; i++ ) {
                        table.append( $('<tr><td><a href="' + link + '#!/conjuntos/' + results[i].name + '" target="_blank">' + results[i].title + '</a></td><td><a href="' + link + '#/instituciones/' + results[i].organization.name + '" target="_blank">' + results[i].organization.title + '</a></td><td>' + results[i].metadata_modified.substring( 0, 10 ) + '</td><td><span class="label" data-format="' + results[i].resources[0].format.replace( / /g, '' ) + '">' + results[i].resources[0].format + '</span></td><td class="ic-dataset"><a href="' + link + '#/conjuntos/' + results[i].name + '" target="_blank"><img src="/assets/img/ic-dataset.png"></a></td></tr>'));
                    }
                });
        }

        if ( $( '#data-tab-downloads' ).length > 0 ) {
            var section     = $( '#data-tab-downloads' ).attr( 'data-tag' );
            $.get( 'http://catalogo.datos.gob.mx/api/3/action/package_search', {
                    q       : 'tags:' + section,
                    rows    : 3,
                    start   : 0,
                    sort    : 'views_recent desc'
                }, function ( data ) {
                    var results = data.result.results,
                        table   = $( '#data-tab-downloads table tbody' );

                    for ( var i = 0; i < results.length; i++ ) {
                        table.append( $('<tr><td><a href="' + link + '#!/conjuntos/' + results[i].name + '" target="_blank">' + results[i].title + '</a></td><td><a href="' + link + '#/instituciones/' + results[i].organization.name + '" target="_blank">' + results[i].organization.title + '</a></td><td>' + results[i].metadata_modified.substring( 0, 10 ) + '</td><td><span class="label" data-format="' + results[i].resources[0].format.replace( / /g, '' ) + '">' + results[i].resources[0].format + '</span></td><td class="ic-dataset"><a href="' + link + '#/conjuntos/' + results[i].name + '" target="_blank"><img src="/assets/img/ic-dataset.png"></a></td></tr>'));
                    }
                });
        }
    },

    _setForm        : function () {
        $( '#search-form' ).submit( function ( e ) {
            e.preventDefault();

            window.open( 'http://busca.datos.gob.mx/#!/conjuntos?q=' + $( '#search-keyword' ).val(), '_blank' );
            $( '#search-keyword' ).val( '' );
        });
    },

    _setPoll        : function () {
        var dismissed   = Cookies.get( 'dgm.poll.dismissed' ),
            setCookie   = function () {
                var date        = new Date(),
                    minutes     = 10;
                date.setTime( date.getTime() + ( minutes * 60 * 1000 ) );

                Cookies.set( 'dgm.poll.dismissed', 'dismissed', {
                    expires : date
                });
            };

        if ( dismissed !== undefined && dismissed == "dismissed" ) {
            $( '#poll' ).css({ display : 'none' });
            $( '#poll-btn' ).css({ display : 'none' });
        }

        if ( $( '#btn-close-poll' ).length > 0 ) {
            $( '#btn-close-poll' ).click( function ( e ) {
                e.preventDefault();

                $( '#poll' ).fadeOut();
                setCookie();
            });
        }

        if ( $( '#btn-close-poll-side' ).length > 0 ) {
            $( '#btn-close-poll-side' ).click( function ( e ) {
                e.preventDefault();

                $( '#poll-btn' ).fadeOut();
                setCookie();
            });
        }
    },

    _setScrolling   : function () {
        $( '#iframe-container' ).click( function () {
            $( '.tool-iframe' ).removeClass( 'scrolloff' );
        });

        $( '.tool-iframe' ).mouseleave( function () {
            $( this ).addClass( 'scrolloff' );
        });
    },

    _setHovers      : function () {
        var item    = $( '.navigation-item .item-img' ),
            img     = $( '.navigation-item img' ),
            link;

        item.height( item.width() * 1.22727273 );

        $( '.navigation-item .link-center' ).css({
            bottom  : ( img.height() ) / 2
        });

        $( '.navigation-item' ).hover( function ( e ) {
            $( '.item-hover', e.currentTarget ).slideToggle( function () {
                link    = $( '.link-center.first', e.currentTarget );
                link.css({
                    bottom  : ( img.height() - link.height() ) / 2,
                    opacity : 1
                }).removeClass( 'first' );
            });
        });

        $( '.post-item' ).hover( function ( e ) {
            $( '.post-overlay', e.currentTarget ).stop().slideToggle();
            $( '.post-overlay', e.currentTarget ).unbind( 'click' ).click( function ( e ) {
                window.location.href    = $( e.currentTarget ).attr( 'data-link' );
            });
        });

        $( '.navigation-item .item-hover' ).click( function ( e ) {
            window.location.href    = $( 'a', $( e.currentTarget ).parent().next() ).attr( 'href' );
        });

        $( '.resource-item .item-hover' ).click( function ( e ) {
            window.location.href    = $( 'a', $( e.currentTarget ) ).attr( 'href' );
        });
    },

    _setRedirects   : function () {
        var pathExist   = function ( name ) {
                for ( var i = Site._redirects.length - 1; i >= 0; i-- ) {
                    var item            = Site._redirects[i],
                        posibleNames    = [ '/' + item.name, '/' + item.name + '/' ];

                    if ( _.contains( posibleNames, name ) )
                        return item;
                }

                return false;
            },
            dependency  = pathExist( window.location.pathname );

        if ( dependency ) {
            $( '#redirect-message' ).show();
            document.title          = "Redireccionando...";
            window.location.href    = dependency.url;
        } else {
            $.get( 'http://catalogo.datos.gob.mx/api/3/action/organization_list', function ( data ) {
                var results = data.result;
                dependency  = window.location.pathname.replace( '/', '' ).toLowerCase();

                if ( results.indexOf( dependency ) != -1 ) {
                    $( '#redirect-message' ).show();
                    document.title          = "Redireccionando...";
                    window.location.href    = 'http://busca.datos.gob.mx/#!/instituciones/' + dependency + '/';
                } else {
                    $('#error-content').show();
                }
            });
        };
    },

    _setResources   : function () {
        var item    = $( '.resource-item .item' );
        item.height( item.width() );

        $( '.resource-item' ).hover( function ( e ) {
            $( '.item-hover', e.currentTarget ).slideToggle();
        });
    },

    _setSidebar     : function () {
        if ( $( '.bg-container' ).length > 0 ) {
            var sidebar     = $( '#dgm-sidebar' ),
                bg          = $( '.bg-container > .bg' );

            bg.css({
                right   : $( window ).width() - ( sidebar.width() + sidebar.position().left + 30 )
            });
        }
    },

    _setSubscribe   : function () {
        $( '#subscribe-form' ).submit( function ( e ) {
            e.preventDefault();

            var form    = $( this ),
                email   = form.find( '.form-control' );

            if ( email.val() == '' ) {
                Site._alert( 'Por favor ingrese una dirección de correo', 'error' );
                email.focus();
            } else {
                $.ajax({
                    type        : form.attr( 'method' ),
                    url         : form.attr( 'action' ),
                    data        : form.serialize(),
                    cache       : false,
                    dataType    : 'json',
                    contentType : "application/json; charset=utf-8",
                    error       : function( err ) {
                        Site._alert( 'Uups, algo paso que no pudimos registrate, intenta más tarde.', 'error' );
                        email.focus();
                    },
                    success     : function( data ) {
                        if ( data.result != "success" ) {
                            Site._alert( 'Al parecer el correo electrónico que ingresaste no existe o es invalido.', 'error' );
                            email.focus();
                        } else {
                            Site._alert( 'Para completar tu registro verifica tu correo electrónico.', 'info' );
                            email.val( '' );
                        }
                    }
                });
            }
        });
    },

    _setToolData    : function () {
        if ( $( '#tool-datasets' ).length > 0 ) {
            $.each( $( '#tool-datasets li' ), function ( i, el ) {
                var $el     = $( el ),
                    list    = $( '#tool-datasets' ),
                    table   = $( 'table.data' ),
                    link    = 'http://busca.datos.gob.mx/';

                $.get( 'http://catalogo.datos.gob.mx/api/3/action/package_show', {
                    id  : $el.html()
                }, function ( data ) {
                    var result  = data.result;

                    table.append( $('<tr><td><a href="' + link + '#!/conjuntos/' + result.name + '" target="_blank">' + result.title + '</a></td><td><a href="' + link + '#!/instituciones/' + result.organization.name + '" target="_blank">' + result.organization.title + '</a></td><td>' + result.metadata_modified.substring( 0, 10 ) + '</td><td><span class="label" data-format="' + result.resources[0].format.replace( / /g, '' ) + '">' + result.resources[0].format + '</span></td><td class="ic-dataset"><a href="' + link + '#/conjuntos/' + result.name + '" target="_blank"><img src="/assets/img/ic-dataset.png"></a></td></tr>'));
                    table.css( 'display', 'block' );
                    list.css( 'display', 'none' );
                });
            });
        }
    },

    _setVideo       : function () {
        $( '#toggle-video' ).click( function ( e ) {
            e.preventDefault();

            $( '#home-video' ).slideToggle();
        });
    }
}

$( document ).ready( Site.init );