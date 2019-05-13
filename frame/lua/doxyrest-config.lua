--------------------------------------------------------------------------------
--
--  This file is part of the Doxyrest toolkit.
--
--  Doxyrest is distributed under the MIT license.
--  For details see accompanying license.txt file,
--  the public copy of which is also available at:
--  http://tibbo.com/downloads/archive/doxyrest/license.txt
--
--------------------------------------------------------------------------------

--!
--! \defgroup global
--! \title Lua Frames Configuration
--! This section describes all the settings affecting the output of the
--! Doxyrest Lua frames.
--!

--!
--! \defgroup config1-common
--! \title Common Settings
--! This section describes common settings controlling input and output paths,
--! titles, force-includes, etc`.
--! @{
--!

FRAME_DIR_LIST = {}

--!
--! The output master (index) reStructuredText file. Usually, the index frame
--! also generates auxillary files -- they will be placed next to the master
--! file. The command line option ``-f`` *overrides* this value.
--! If neither ``FRAME_FILE`` nor ``-f`` is specified, ``index.rst.in`` will be
--! used as the default frame file.
--!

FRAME_FILE = nil

--!
--! The input master (index) XML file. Specifying it here allows calling
--! ``doxyrest`` without parameters; otherwise, the master XML *must* be passed
--! via the command line. If both ``INPUT_FILE`` and command line parameter are
--! specified, the command line takes precedence.
--!

INPUT_FILE = nil

--!
--! The output master (index) reStructuredText file. Usually, the index frame
--! also generates auxillary files -- they will be placed next to the master
--! file. The command line option ``-o`` *overrides* this value. If neither
--! ``OUTPUT_FILE`` nor ``-o`` is specified, ``index.rst`` will be used as
--! the default output master file.
--!

OUTPUT_FILE = nil

--!
--! File with project-specific reStructuredText definitions. When non``nil``,
--! this file will be included at the top of every generated ``.rst`` file.
--!

FORCE_INCLUDE_FILE = nil

--!
--! If you want to add extra reStructuredText documentation pages, do so
--! by adding them to this list.
--!

EXTRA_PAGE_LIST = {}

--!
--! The title of the main (index) page.
--!

INDEX_TITLE = "My Lua Project Documentation"

--!
--! File with project introduction (reStructuredText). When non-nil, this file
--! will be included into ``index.rst`` file and NOT added to the list of other
--! documentation pages.
--!

INTRO_FILE = nil

--!
--! Specify whether to sort groups lexicographically (by ``title``) or
--! logically (by ``id``).
--!

SORT_GROUPS_BY = "title"

--!
--! Specify whether to sort global members (variables and functions) by
--! ``name``.
--!

SORT_GLOBAL_MEMBERS = true

--[[!
	By default, the page for the global namespace page will be called
	"Global Scope" and will contain no description except that for the
	global compounds and members.

	It's possible to override this behaviour by defining an auxillary compound
	(page or group) with a special ``id``; this page/group may contain a
	user-defined title,  a brief description and a detailed description. Use
	``GLOBAL_AUX_COMPOUND_ID`` to define this special id.

	.. note::

		To make sure you use the correct **Doxygen** XML ID of the group/page,
		find the definition of the group in one of ``.xml`` files and copy
		the value of ``id`` attribute.

		For example, if the group was declared as ``\defgroup global`` then
		the its ``id`` will probably be either ``group_<your-group-name>`` or
		``group__<your-group-name>``.
]]


GLOBAL_AUX_COMPOUND_ID = "group_global"

--!
--! Convert ``\verbatim`` sections in doxy-comments to ``.. code-block::``
--! sections in the output reStructuredText. The string value of
--! ``VERBATIM_TO_CODE_BLOCK`` will be used as the language of
--! ``.. code-block::`` section. By default, it's ``none`` which results in
--! no syntax highlighting. To disable conversion at all, use ``nil``.
--!

VERBATIM_TO_CODE_BLOCK = "none"

--!
--! If the original doxy comments contain asterisks, they have to be escaped
--! in reStructuredText (asterisks are used to mark **bold** or *italic* blocks).
--!

ESCAPE_ASTERISKS = false

--!
--! If the original doxy comments contain pipe characters ``|``, they have to be
--! escaped in reStructuredText (pipes are used for substitution references).
--!

ESCAPE_PIPES = false

--!
--! If the original doxy comments contain trailing underscores, they have to be
--! escaped in reStructuredText (trailing underscores are used for internal
--! links).
--!

ESCAPE_TRAILING_UNDERSCORES = false

--!
--! Exclude items declared in specific locations. Use a regular expression to
--! define a mask of directories/source files to completely exclude from the
--! final documentation. For example, ``.*/impl/.*lua$`` will exclude all
--! ``.lua`` files located in ``impl/`` directory.
--!

EXCLUDE_LOCATION_PATTERN = nil

--!
--! Exclude variables and functions without any documentation (no doxy-comments).
--!

EXCLUDE_UNDOCUMENTED_ITEMS = false

--[[!
	Add cids (code IDs) targets for items.

	To make use of code IDs, set the Sphinx ``default_role`` setting to ``cref``
	and then reference items from inside reStructuredText like this:

	.. code-block::

		`Point.x` will reference a field "x" inside "struct Point"

	When Doxyrest is used with legacy Doxygen projects, ``ITEM_CID_TARGETS`` can
	be set to ``false`` to reduce the overall number of targets.
]]

ITEM_CID_TARGETS = true

--!
--! \subgroup
--!
--! By default, Doxyrest tries to translate Doxygen ``\section``,
--! ``\subsection``, and ``\subsubsection`` commands (as well as the
--! ``<heading level="n">`` blocks generated by Doxygen from Markdown titles
--! inside comments) into reStructuredText titles.
--!
--! This sometimes leads to problems because Doxygen headings may appear outside
--! of the global scope (e.g. inside lists) while reStructuredText titles are
--! only allowed at the global scope. Another issue is Doxygen headings may
--! yield inconsistent title structure (e.g. a title level 1 followed by level
--! 3).
--!
--! If you run into these issues, use ``SECTION_TO_RUBRIC`` or
--! ``HEADING_TO_RUBRIC``  to always convert Doxygen sections or ``<heading>``
--! blocks or into reStructuredText ``.. rubric::`` directives. This yields
--! uni-level headings, but solves both aforementioned problems.
--!

SECTION_TO_RUBRIC = false
HEADING_TO_RUBRIC = false

--! @}

--!
--! \defgroup config2-cmake
--! \title Lua-specific Settings
--! This section describes settings specific for Lua frames.
--! @{
--!

--[[!
	Insert space between function name and parameter list like this:

	.. code-block:: lua

		function foo ()

	By default, ``PRE_PARAM_LIST_SPACE`` is ``false`` which yields:

	.. code-block:: lua

		function foo()
]]


PRE_PARAM_LIST_SPACE = false

--!
--! Use multi-line parameter lists in function declarations if parameter count is
--! greater than this threshold. ``nil`` means don't use parameter count
--! threshold.
--!

ML_PARAM_LIST_COUNT_THRESHOLD = nil

--!
--! Use multi-line parameter lists in function declarations if single-line
--! declaration length parameter count is greater than this threshold.
--! ``nil`` means don't use length threshold.
--!

ML_PARAM_LIST_LENGTH_THRESHOLD = 80

--! @}
